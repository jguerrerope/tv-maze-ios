import Foundation
import Combine

protocol MazeService {
    func getShows(page: Int) -> AnyPublisher<[TVShowTO], Error>
}

class MazeServiceImpl {
    
    private let service: NetworkService<MazeAPI>
    
    public init(service: NetworkService<MazeAPI>) {
        self.service = service
    }
}

extension MazeServiceImpl: MazeService {
    
    func getShows(page: Int) -> AnyPublisher<[TVShowTO], Error> {
        return service.get(api: .shows(page: page))
    }
}


