import Foundation
import OHHTTPStubs
import OHHTTPStubsSwift
import XCTest

class ServiceClientStub {
    
    public static func removeAllStubs() {
        HTTPStubs.removeAllStubs()
    }
    
    public static func configureStub(pathMatches path: String,
                                     containsQueryParams params: [String: String],
                                     responseDataFromFile fileName: String) {
        
        stub(condition: pathMatches(path) && containsQueryParams(params)) { _ in
            let jsonData = try! readFileFromBudle(fileName: fileName)
            return HTTPStubsResponse(data: jsonData, statusCode: 200, headers: nil)
        }
    }
    
    public static func configureStub(pathMatches path: String,
                                     responseDataFromFile fileName: String) {
        
        stub(condition: pathMatches(path)) { _ in
            let jsonData = try! readFileFromBudle(fileName: fileName)
            return HTTPStubsResponse(data: jsonData, statusCode: 200, headers: nil)
        }
    }
    
    public static func configureStub(pathMatches path: String,
                                     containsBodyParams params: [String: Any],
                                     responseDataFromFile fileName: String) {
        stub(condition: pathMatches(path) && hasJsonBody(params)) { _ in
            let jsonData = try! readFileFromBudle(fileName: fileName)
            return HTTPStubsResponse(data: jsonData, statusCode: 200, headers: nil)
        }
    }
    
    public static func configureNoContentStub(pathMatches path: String, expectation: XCTestExpectation? = nil ) {
        
        stub(condition: pathMatches(path)) { _ in
            expectation?.fulfill()
            return HTTPStubsResponse(data: Data(), statusCode: 204, headers: nil)
        }
    }
}

// MARK: helper methods
extension ServiceClientStub {
    
    private static func readFileFromBudle(fileName: String) throws -> Data {
        let path = Bundle(for: ServiceClientStub.self).url(forResource: fileName, withExtension: "json")
        return try! Data(contentsOf: path!, options: Data.ReadingOptions.mappedIfSafe)
    }
}
