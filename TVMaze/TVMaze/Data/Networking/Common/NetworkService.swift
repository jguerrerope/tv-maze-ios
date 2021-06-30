import Foundation

protocol NetworkAPI {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension NetworkAPI {
    
    var queryItems: [URLQueryItem] {
        get {
            return []
        }
    }
    
    var body: Encodable {
        preconditionFailure("should override for post")
    }
}
