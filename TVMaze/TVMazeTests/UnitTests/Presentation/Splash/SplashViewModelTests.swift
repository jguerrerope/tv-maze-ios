import XCTest
import Cuckoo
import Foundation
import Combine

@testable import TVMaze

class SplashViewModelTests: XCTestCase {
    
    private var mockTVShowRepository: MockTVShowRepository!
   
    private var sut: SplashViewModel!
    
    override func setUp() {
        mockTVShowRepository = MockTVShowRepository()
        
        sut = SplashViewModel(
            delayScreenInSeconds: 0,
            dispacherHelper: TestDispacherHelperImpl()
        )
    }
    
    func test_should_User_see_SplashLogo() {
        // when
        sut.setUp()
        let result =  blockingAndGet(from: sut.navigate)
        
        // then
        XCTAssertNotNil(result)
        XCTAssertEqual(result , true)
    }
}

