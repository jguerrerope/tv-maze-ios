import Foundation
import Combine

class TVShowRepositoryImpl  {
    private let mazeService: MazeService
    
    public init(mazeService: MazeService) {
        self.mazeService = mazeService
    }
}

extension TVShowRepositoryImpl: TVShowRepository {
    
    public func getTVShows(page: Int) -> AnyPublisher<[TVShow], Error> {
        return mazeService.getShows(page: page)
            .map { showTOList in
                return showTOList.toTVShowList()
            }
            .eraseToAnyPublisher()
    }
}


    
