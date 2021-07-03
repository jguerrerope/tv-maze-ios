import Foundation
import XCTest

@testable import TVMaze

var app = XCUIApplication()

class BaseScreen {
    
    func waitForOtherElementsPresent(screenId: String, timeout: TimeInterval = 5) {
        let resultView = app.otherElements[screenId]
        let viewExists = resultView.waitForExistence(timeout: timeout)
        XCTAssert(viewExists)
    }
    
    func otherElementsPresent(screenId: String) {
        let resultView = app.otherElements[screenId]
        XCTAssert(resultView.exists)
    }
    
    func tapOnCellByPosition(position: Int){
        let cell = app.cells.element(boundBy: position)
        cell.tap()
    }
}

