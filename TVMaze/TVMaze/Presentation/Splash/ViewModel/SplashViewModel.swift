import Foundation

class SplashViewModel {
    private static let defaultDelayScreenInSeconds: Double = 3
    
    private let delayScreenInSeconds: Double
    private let dispacherHelper: DispacherHelper
    
    let navigate = ReactiveValue<Bool>()
    
    init(delayScreenInSeconds: Double = SplashViewModel.defaultDelayScreenInSeconds, dispacherHelper: DispacherHelper) {
        self.delayScreenInSeconds = delayScreenInSeconds
        self.dispacherHelper = dispacherHelper
    }
   
    func setUp() {
        dispacherHelper.io().asyncAfter(deadline: .now() + self.delayScreenInSeconds) { [weak self] in
            self?.navigate.postValue(true)
        }
    }
}
