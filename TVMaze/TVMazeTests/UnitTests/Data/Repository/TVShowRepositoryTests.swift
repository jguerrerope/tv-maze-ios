import XCTest
import Cuckoo
import Foundation
import Combine

@testable import TVMaze

class TVShowRepositoryTests: XCTestCase {
    
    var mockMazeService: MockMazeService!
    var sut: TVShowRepository!

    override func setUp() {
        mockMazeService = MockMazeService()
        sut = TVShowRepositoryImpl(
            mazeService: mockMazeService
        )
    }

    func test_should_User_see_TV_show_list() throws {
        // given
        let page = 1
        let tvShowTOList = createTVShowTOList()
        let tvShowListExpected = createTVShowList()

        stub(mockMazeService) { stub in
            let listPublisher: AnyPublisher<[TVShowTO], Error> = Just(tvShowTOList)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()

            when(stub.getShows(page: page)).thenReturn(listPublisher)
        }

        // when
        let result: [TVShow]? = blockingAndGet(from: sut.getTVShows(page: page))

        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(result, tvShowListExpected)
        verify(mockMazeService).getShows(page: equal(to: page))
    }
}

extension TVShowRepositoryTests {

    private func createTVShowTOList(size: Int = 2) -> [TVShowTO] {
        return (0...size).map {
            TVShowTO(
                id: $0,
                name: "\($0)_name",
                type: "\($0)_type",
                language: "\($0)_language",
                genres: ["\($0)_genres"],
                image: TVShowTO.ImageTO(
                    original: "\($0)_image_original",
                    medium: "\($0)_image_medium"
                )
            )
        }
    }

    private func createTVShowList(size: Int = 2) -> [TVShow] {
        return (0...size).map {
            TVShow(
                id: "\($0)",
                name: "\($0)_name",
                type: "\($0)_type",
                language: "\($0)_language",
                genres: ["\($0)_genres"],
                image: "\($0)_image_original"
            )
        }
    }
}
