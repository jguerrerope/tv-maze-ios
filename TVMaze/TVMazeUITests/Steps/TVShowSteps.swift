import Foundation
import XCTest

class HomeSteps {
    
    private var homeScreen: HomeScreen
    
    init() {
        homeScreen = HomeScreen()
    }
    
    /// I see TVShow list
    func i_see_tvshow_list() {
        XCTContext.runActivity(named: "I see TVShow list") { _ in
            homeScreen.isPresent()
        }
    }
    
    /// I tap on TVShow endLess scrolling
    func i_open_tvshow_details() {
        XCTContext.runActivity(named: "I open TVShow details") { _ in
            let screen = homeScreen.tapOnTVShow()
            screen.isPresent()
        }
    }
}
