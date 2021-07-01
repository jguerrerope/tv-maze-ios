import Foundation

public class DispacherHelperImpl: DispacherHelper {
    
    public func main() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    public func io() -> DispatchQueue {
        return DispatchQueue.global()
    }
}
