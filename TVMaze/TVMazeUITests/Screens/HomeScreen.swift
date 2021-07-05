import Foundation
import XCTest

@testable import TVMaze

class HomeScreen : BaseScreen {
    private static let homeScreen = "HomeScreen"
    private static let tvShowCell = "tvShowCell_0"
    
    func isPresent() {
        waitForOtherElementsPresent(screenId: HomeScreen.homeScreen)
    }
    
    func tapOnTVShow() -> TVShowScreen {
        waitForCellPresent(screenId: HomeScreen.tvShowCell)
        tapOnCell(screenId: HomeScreen.tvShowCell)
        return TVShowScreen()
    }
}

