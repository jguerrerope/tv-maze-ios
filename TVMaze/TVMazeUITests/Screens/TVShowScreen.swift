
import Foundation
import XCTest

@testable import TVMaze

class TVShowScreen : BaseScreen {
    static let tvShowDetailsScreen =  "TVShowDetailsScreen"

    func isPresent() {
        waitForOtherElementsPresent(screenId: TVShowScreen.tvShowDetailsScreen, timeout: 5)
    }
}

