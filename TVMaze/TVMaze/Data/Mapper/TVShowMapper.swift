import Foundation

/**
 TVShowTO
 */

extension TVShowTO {
 
    func toTVShow() -> TVShow {
        return TVShow(
            id: String(self.id),
            name: self.name,
            type: self.type,
            language: self.language,
            genres: self.genres,
            image: self.image.original
        )
    }
}


