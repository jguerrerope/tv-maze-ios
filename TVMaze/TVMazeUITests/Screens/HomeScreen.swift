
import Foundation
import XCTest

@testable import TVMaze

class HomeScreen : BaseScreen {
    private static let homeScreen =  "HomeScreen"

    func isPresent() {
        waitForOtherElementsPresent(screenId: HomeScreen.homeScreen, timeout: 5)
    }
    
    func tapOnTVShow() -> TVShowScreen {
        tapOnCellByPosition(position: 3)
        return TVShowScreen()
    }
}

