import XCTest
import Cuckoo
import Foundation
import Combine

@testable import TVMaze

class GetTVShowsUseCaseTests: XCTestCase {
    
    private var mockTVShowRepository: MockTVShowRepository!
   
    private var sut: GetTVShowsUseCase!
    
    override func setUp() {
        mockTVShowRepository = MockTVShowRepository()
        
        sut = GetTVShowsUseCase(
            tvShowRepository: mockTVShowRepository,
            dispacherHelper: TestDispacherHelperImpl()
        )
    }
    
    func test_should_User_see_TV_Show_list() {
        // given
        let page = 1
        let tvShowListExpected = createTVShowList()

        stub(mockTVShowRepository) { stub in
            let listPublisher: AnyPublisher<[TVShow], Error> = Just(tvShowListExpected)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()

            when(stub.getTVShows(page: page)).thenReturn(listPublisher)
        }

        // when
        let params = GetTVShowsUseCaseParams(page: page)
        let result: [TVShow]? = blockingAndGet(from: sut.build(params: params))

        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(result , tvShowListExpected)
        verify(mockTVShowRepository).getTVShows(page: equal(to: page))
    }
}

extension GetTVShowsUseCaseTests {

    private func createTVShowList(size: Int = 2) -> [TVShow] {
        return (0...size).map {
            TVShow(
                id: "\($0)",
                name: "\($0)_name",
                image: "\($0)_image_original",
                type: "\($0)_type",
                language: "\($0)_language",
                genres: ["\($0)_genres"],
                summary: "\($0)_summary",
                rating: 0.50
            )
        }
    }
}

