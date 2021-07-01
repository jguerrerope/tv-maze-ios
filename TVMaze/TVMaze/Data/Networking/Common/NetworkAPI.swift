import Foundation
import Combine


class NetworkService<API: NetworkAPI>: NSObject, URLSessionTaskDelegate {
    
    private enum RequestType: String {
        case GET = "GET"
        case POST = "POST"
    }
    
    private let baseUrl: String
    
    public init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func get<T: Decodable>(api: API) -> AnyPublisher<T, Error> {
        var urlRequest = createURLRequest(api, .GET)
        
        createHeaders().forEach { (key, value) in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return execute(urlRequest)
    }
    
    func post<T: Decodable>(api: API) -> AnyPublisher<T, Error> {
        var urlRequest = createURLRequest(api, .POST)
        createHeaders().forEach { (key, value) in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return execute(urlRequest)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        completionHandler(request)
    }
}

extension NetworkService {
    
    private func createURLRequest(_ api: API, _ type: RequestType) -> URLRequest {
        let components = createURLComponents(api)
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = type.rawValue
        
        if case .POST = type {
            do {
                let data = try JSONSerialization.data(withJSONObject: api.body.asDict(), options: .prettyPrinted)
                urlRequest.httpBody = data
            } catch  {
                preconditionFailure("Invalid body components: \(error)")
            }
            
        }
        
        return urlRequest
    }
    
    private func createURLComponents(_ api: API) -> URLComponents {
        guard let baseURL = URL(string: self.baseUrl) else {
            fatalError("Couldn't create base URL. \(self.baseUrl)")
        }
        
        guard var components = URLComponents(url: baseURL.appendingPathComponent(api.path), resolvingAgainstBaseURL: true) else {
            fatalError("Couldn't create URLComponents")
        }
        
        components.queryItems = api.queryItems
        return components
    }
    
    private func execute<T: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { result -> T in
                let value = try JSONDecoder().decode(T.self, from: result.data) // 4
                return value
            }
            .eraseToAnyPublisher()
    }
    
    private func createHeaders() -> [String: Any] {
        return [:]
    }
}
