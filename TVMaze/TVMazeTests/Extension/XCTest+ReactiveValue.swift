import XCTest
import Foundation
@testable import TVMaze

extension XCTestCase {
  
    func blockingAndGet<T>(
        from reactiveValue: ReactiveValue<T>,
        timeout: TimeInterval = 1,
        file: StaticString = #file,
        line: UInt = #line
    ) -> T? {
        let exp = expectation(description: "")
        
        var valueExpected: T? = nil
        reactiveValue.addAndNotify(self) { value in
            valueExpected = value
            exp.fulfill()
        }
          
        wait(for: [exp], timeout: timeout)
        
        return valueExpected
    }
    
    // MARK: Resource<T> blocking
    func blockingAndGetResource<T>(
        from reactiveValue: ReactiveValue<Resource<T>>,
        timeout: TimeInterval = 1,
        file: StaticString = #file,
        line: UInt = #line
    ) -> T? {
        var valueExpected: T? = nil
        
        let exp = expectation(description: "")
      
        reactiveValue.addAndNotify(self) { resource in
            if case .loading = resource {
                return
            }
        
            switch resource {
            case .success(let value):
                valueExpected = value
                exp.fulfill()
            default:
                break
            }
        }
          
        wait(for: [exp], timeout: timeout)
        
        return valueExpected
    }
    
    
    func blockingAndIgnoreResource<T>(
        from reactiveValue: ReactiveValue<Resource<T>>,
        timeout: TimeInterval = 1,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let exp = expectation(description: "")
        reactiveValue.addAndNotify(self) { resource in
            if case .loading = resource {
                return
            }
            
            exp.fulfill()
        }
        wait(for: [exp], timeout: timeout)
    }
    
    func blockingAndIgnore<T>(
        from reactiveValue: ReactiveValue<T>,
        timeout: TimeInterval = 1,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let exp = expectation(description: "")
        reactiveValue.addAndNotify(self) { resource in
            exp.fulfill()
        }
          
        wait(for: [exp], timeout: timeout)
    }
}
