import Foundation

extension TVShow {
 
    func toHomeSectionViewPayload() -> HomeSectionViewPayload {
        return .show(TVShowItemViewPayload(
            id: self.id,
            title: self.name,
            image: self.image
        ))
    }
}


