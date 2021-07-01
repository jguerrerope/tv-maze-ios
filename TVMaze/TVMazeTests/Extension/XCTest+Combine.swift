import XCTest
import Foundation
import Combine

extension XCTestCase {

    func blockingAndGet<P: Publisher, Result>(
        from publisher: P,
        timeout: TimeInterval = 2,
        file: StaticString = #file,
        line: UInt = #line
    ) -> Result? {
        let exp = expectation(description: "")
        
        var valueExpected: Result? = nil
        let cancellable = publisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    exp.fulfill()
                    
                case .finished:
                    exp.fulfill()
                }
        
            }, receiveValue: { value in
                valueExpected = value as? Result
            })
          
        
        XCTAssertNotNil(cancellable)
        wait(for: [exp], timeout: 1)
        
        return valueExpected
    }
}
