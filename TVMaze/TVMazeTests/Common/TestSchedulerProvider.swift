import Foundation
import Combine

@testable import TVMaze

internal class TestDispacherHelperImpl: DispacherHelper {
    
    public func main() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    public func io() -> DispatchQueue {
        return DispatchQueue.main
    }
}
