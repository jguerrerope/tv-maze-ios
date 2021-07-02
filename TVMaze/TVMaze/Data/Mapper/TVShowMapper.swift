import Foundation

/**
 TVShowTO
 */

extension TVShowTO {
    
    func toTVShow() throws -> TVShow {
        guard let image = self.image?.original else {
            throw GeneralDomainError.mapping
        }
        
        let rating = self.rating?.average ?? 0.0
        
        let sanitizeSummary = self.summary.replacingOccurrences(of: "<[^>]+>",
                                                                with: "",
                                                                options: .regularExpression,
                                                                range: nil)
        return TVShow(
            id: String(self.id),
            name: self.name,
            image: image,
            type: self.type,
            language: self.language,
            genres: self.genres,
            summary: sanitizeSummary,
            rating: rating
        )
    }
}

extension Array where Element == TVShowTO {
    
    func toTVShowList() -> [TVShow] {
        return self.compactMap {
            do {
                return try $0.toTVShow()
            } catch {
                return nil
            }
        }
    }
}


