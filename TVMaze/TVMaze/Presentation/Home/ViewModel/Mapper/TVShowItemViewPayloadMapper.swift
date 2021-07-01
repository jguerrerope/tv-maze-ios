import Foundation


extension TVShow {
 
    func toTVShowItemViewPayload() -> TVShowItemViewPayload {
        return TVShowItemViewPayload(
            title: self.name,
            image: self.image
        )
    }
}


