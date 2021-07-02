import XCTest
import Cuckoo
import Foundation
import Combine

@testable import TVMaze

class HomeViewModelTests: XCTestCase {
    
    private var mockGetTVShowsUseCase: MockQueryUseCase<GetTVShowsUseCaseParams, [TVShow]>!
    private var sut: HomeViewModel!
    
    override func setUp() {
        ReactiveCoreUtils.disableDispacher()
        
        mockGetTVShowsUseCase = MockQueryUseCase(
            dispacherHelper: TestDispacherHelperImpl()
        )
        
        sut = HomeViewModel(
            getTVShowsUseCase: mockGetTVShowsUseCase
        )
    }
    
    func test_should_User_see_Skeleton() {
        // given
        let homeItemsExpected: [HomeSectionViewPayload] = [.nextPage(HomeViewModel.defaultNextPageId)]
        
        // when
        sut.setUp()
        let result: [HomeSectionViewPayload]? =  blockingAndGetResource(from: sut.homeItems)
        
        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(homeItemsExpected, result)
    }
    
    func test_should_User_see_TVShowList() {
        // given
        let page = 1
        let listSize = 3
        let tvShowList = createTVShowList(size: listSize)
        let lastId = "\(listSize)"
        let homeItemsExpected = createHomeSectionViewPayloadListWithNextPage(size: listSize, nextPageId: lastId)
        
        stub(mockGetTVShowsUseCase) { stub in
            let listPublisher: AnyPublisher<[TVShow], Error> = Just(tvShowList)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
            
            let param = GetTVShowsUseCaseParams(page: page)
            when(stub.build(params: equal(to: param))).thenReturn(listPublisher)
            
            when(stub.execute(
                params: any(),
                delayInSeconds: any(),
                onSuccess: any(),
                onError: any(),
                onFinished: any()
            )).thenCallRealImplementation()
        }
        
        // when
        sut.setUp()
        sut.loadNextPage(from: HomeViewModel.defaultNextPageId)
        
        let result: [HomeSectionViewPayload]? =  blockingAndGetResource(from: sut.homeItems)
        
        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(homeItemsExpected, result)
    }
    
    func test_should_User_see_TVShow_details() {
        // given
        let page = 1
        let tvShowList = createTVShowList()
        let tvShowExpected = createTVShow(id: 0)
        
        stub(mockGetTVShowsUseCase) { stub in
            let listPublisher: AnyPublisher<[TVShow], Error> = Just(tvShowList)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
            
            let param = GetTVShowsUseCaseParams(page: page)
            when(stub.build(params: equal(to: param))).thenReturn(listPublisher)
            
            when(stub.execute(
                params: any(),
                delayInSeconds: any(),
                onSuccess: any(),
                onError: any(),
                onFinished: any()
            )).thenCallRealImplementation()
        }
        
        // when
        sut.setUp()
        sut.loadNextPage(from: HomeViewModel.defaultNextPageId)
        blockingAndIgnoreResource(from: sut.homeItems)
        sut.onTVShowselected(id: tvShowExpected.id)
        
        let result: TVShow? =  blockingAndGet(from: sut.navigateToTVShowDetails)
        
        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(tvShowExpected, result)
    }
    
    func test_should_User_see_TVShowList_endless() {
        // given
        let listSize = 3
        let lastIdPage = "\(listSize * 2)"
        
        let tvShowListPage1 = createTVShowList(size: listSize)
        let tvShowListPage2 = createTVShowList(start: listSize, size: listSize)
        
        let homeItemsExpectedPage1 = createHomeSectionViewPayloadList(size: listSize)
        let homeItemsExpectedPage2 = createHomeSectionViewPayloadList(start: listSize, size: listSize)
        
        let homeItemsExpected = [
            homeItemsExpectedPage1,
            homeItemsExpectedPage2,
            [.nextPage(lastIdPage)]
        ].flatMap { $0 }
        
        stub(mockGetTVShowsUseCase) { stub in
            let listPublisherPag1: AnyPublisher<[TVShow], Error> = Just(tvShowListPage1)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
            
            when(stub.build(params: equal(to: GetTVShowsUseCaseParams(page: 1)))).thenReturn(listPublisherPag1)
            
            
            let listPublisherPag2: AnyPublisher<[TVShow], Error> = Just(tvShowListPage2)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
            when(stub.build(params: equal(to: GetTVShowsUseCaseParams(page: 2)))).thenReturn(listPublisherPag2)
            
            when(stub.execute(
                params: any(),
                delayInSeconds: any(),
                onSuccess: any(),
                onError: any(),
                onFinished: any()
            )).thenCallRealImplementation()
        }
        
        // when
        sut.setUp()
        
        sut.loadNextPage(from: HomeViewModel.defaultNextPageId)
        let resultWithPage1: [HomeSectionViewPayload]? =  blockingAndGetResource(from: sut.homeItems)
        
        sut.loadNextPage(from: lastIdPage)
        let resultWithPage2: [HomeSectionViewPayload]? =  blockingAndGetResource(from: sut.homeItems)

        // then
        XCTAssertNotNil(resultWithPage1)
        XCTAssertNotNil(resultWithPage2)
        XCTAssertEqual(resultWithPage2, homeItemsExpected)
    }
}

extension HomeViewModelTests {
    
    private func createTVShow(id: Int) -> TVShow {
        return TVShow(
            id: "\(id)",
            name: "\(id)_name",
            image: "\(id)_image_original",
            type: "\(id)_type",
            language: "\(id)_language",
            genres: ["\(id)_genres"],
            summary: "\(id)_summary",
            rating: 0.50
        )
    }

    private func createTVShowList(start: Int = 0, size: Int = 2) -> [TVShow] {
        return (start...(start + size)).map {
            createTVShow(id: $0)
        }
    }
    
    private func createHomeSectionViewPayloadList(start: Int = 0, size: Int = 2) -> [HomeSectionViewPayload] {
        return (start...(start + size)).map {
            .show(TVShowItemViewPayload(
                id: "\($0)",
                title:    "\($0)_name",
                image: "\($0)_image_original"
            ))
        }
    }
    
    private func createHomeSectionViewPayloadListWithNextPage(start: Int = 0, size: Int = 2, nextPageId: String) -> [HomeSectionViewPayload] {
        return (start...(start + size)).map {
            .show(TVShowItemViewPayload(
                id: "\($0)",
                title:    "\($0)_name",
                image: "\($0)_image_original"
            ))
        } + [.nextPage(nextPageId)]
    }

}

