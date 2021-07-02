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


extension Array where Element == TVShow {
    
    func toHomeSectionViewPayloadList() -> [HomeSectionViewPayload] {
        return self.compactMap {
            do {
                return try $0.toHomeSectionViewPayload()
            } catch {
                return nil
            }
        }
    }
}

