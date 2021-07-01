import Foundation
import Combine

public protocol TVShowRepository {
    
    func getTVShows(page: Int) -> AnyPublisher<[TVShow], Error>
}
