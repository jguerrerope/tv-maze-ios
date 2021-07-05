import UIKit
import Foundation
import AlamofireImage

extension TVShowDetailsViewController {
    
    func setupViewModel() {
        viewModel.tvShow.addAndNotify(self, { [weak self] tvShow in
            self?.bindTVShow(tvShow)
        })
    }
    
    private func bindTVShow(_ tvShow: TVShow) {
        title = tvShow.name
        
        if let url = URL(string: tvShow.image) {
            imageView.af.setImage(withURL: url, imageTransition: .crossDissolve(0.2))
        }
        
        typeTitleSubtitleView.subtitle = tvShow.type
        languageTitleSubtitleView.subtitle = tvShow.language
        
        if tvShow.genres.isEmpty {
            genreTitleSubtitleView.subtitle = "tv_show_genre_placeholder".localized()
        } else {
            genreTitleSubtitleView.subtitle = tvShow.genres.joined(separator: " · ")
        }
        ratingTitleSubtitleView.subtitle = String(tvShow.rating)
        summaryLabel.text = tvShow.summary
    }
}

