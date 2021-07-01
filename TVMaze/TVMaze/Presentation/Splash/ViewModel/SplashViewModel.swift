import Foundation

class SplashViewModel {
    
    private static let delayScreenInSeconds: Double = 3
    
    private let dispacherHelper: DispacherHelper
    
    let navigate = ReactiveValue<Bool>()
    
    init(dispacherHelper: DispacherHelper) {
        self.dispacherHelper = dispacherHelper
    }
   
    func setUp() {
        dispacherHelper.io().asyncAfter(deadline: .now() + SplashViewModel.delayScreenInSeconds) { [weak self] in
            self?.navigate.postValue(true)
        }
    }
}
