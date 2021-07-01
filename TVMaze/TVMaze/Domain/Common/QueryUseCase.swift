import Foundation
import Combine

public class QueryUseCase<P: UseCaseParams, R>: UseCase<P, AnyPublisher<R, Error>> {
    
    private let dispacherHelper: DispacherHelper
    private var cancellable: AnyCancellable? = .none
    
    public init(dispacherHelper: DispacherHelper) {
        self.dispacherHelper = dispacherHelper
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    override open func build(params: P? = nil) -> AnyPublisher<R, Error> {
        preconditionFailure("This method must be overridden")
    }
    
    public func execute(params: P? = nil,
                        delayInSeconds: Int? = nil,
                        onSuccess: ((R) -> Void)? = nil,
                        onError: ((Swift.Error) -> Void)? = nil,
                        onFinished: (() -> Void)? = nil) {
        
        cancellable?.cancel()
        
        cancellable = build(params: params)
            .delay(for: .seconds(delayInSeconds ?? 0), scheduler: DispatchQueue.global())
            .subscribe(on: self.dispacherHelper.io())
            .receive(on: self.dispacherHelper.main())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error): onError?(error)
                case .finished: onFinished?()
                }
            }, receiveValue: { result in
                onSuccess?(result)
            })
    }
}
