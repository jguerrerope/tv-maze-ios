import Foundation

enum MazeAPI: NetworkAPI {
    case shows(page: Int)
    
    var path: String {
        switch self {
        case .shows:
            return "/shows"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .shows(let page):
            return [
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
}
