import Foundation

public class SplashViewModel {
    
    private static let delayScreenInSeconds: Double = 3
    
    private let dispacherHelper: DispacherHelper
    
    let navigate = ReactiveValue<Bool>()
    
    public init(dispacherHelper: DispacherHelper) {
        self.dispacherHelper = dispacherHelper
    }
   
    func setUp() {
        dispacherHelper.io().asyncAfter(deadline: .now() + SplashViewModel.delayScreenInSeconds) { [weak self] in
            self?.navigate.postValue(true)
        }
    }
}
