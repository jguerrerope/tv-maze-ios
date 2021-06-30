import Foundation

public protocol DispacherHelper {
    
    func main() -> DispatchQueue
    
    func io() -> DispatchQueue
}
