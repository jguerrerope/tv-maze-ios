import Foundation

public protocol UseCaseParams {}
public struct NotUseCaseParams: UseCaseParams {}

public class UseCase<P: UseCaseParams, R> {
    
    open func build(params: P? = nil) -> R {
        preconditionFailure("This method must be overridden")
    }
}
