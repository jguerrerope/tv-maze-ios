import XCTest
import OHHTTPStubs

@testable import TVMaze

class MazeServiceTests: XCTestCase {

    var sut: MazeService!
    
    override func setUp() {
        sut = MazeServiceImpl(service: NetworkService<MazeAPI>(baseUrl: "https://test.com"))
    }
    
    override func tearDown() {
        ServiceClientStub.removeAllStubs()
        super.tearDown()
    }

    func test_should_User_see_shows() {
        // given
        let page = 1
        let path = "/shows"
        
        ServiceClientStub.configureStub(pathMatches: path, containsQueryParams: ["page": String(page)], responseDataFromFile: "tv_shows")

        // when
        let result: [TVShowTO]? = blockingAndGet(from: sut.getShows(page: page))
        
        // then
        XCTAssertNotNil(result)
    }
}
