import Foundation

class TVShowDetailsViewModel {
    
    let tvShow = ReactiveValue<TVShow>()
    
    init(tvShow: TVShow) {
        self.tvShow.value = tvShow
    }
    
    func setUp() {
    }
}
