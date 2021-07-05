import XCTest

@testable import TVMaze

class TVShowFeature: XCTestCase {
    private var homeSteps: HomeSteps!
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        
        homeSteps = HomeSteps()
    }
    
    func test_TVShow_details() throws {
        homeSteps.i_see_tvshow_list()
        homeSteps.i_open_tvshow_details()
    }
}
