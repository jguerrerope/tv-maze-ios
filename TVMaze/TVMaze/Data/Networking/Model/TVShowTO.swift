import Foundation

struct TVShowTO: Codable {
    
    let id: Int
    let name: String
    let type: String
    let language: String
    let genres: [String]
    let image: ImageTO?
    let rating: RatingTO?
    let summary: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case language = "language"
        case genres = "genres"
        case image = "image"
        case rating = "rating"
        case summary = "summary"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.language = try container.decode(String.self, forKey: .language)
        self.genres = try container.decode([String].self, forKey: .genres)
        self.image = try container.decode(ImageTO?.self, forKey: .image)
        self.rating = try container.decode(RatingTO?.self, forKey: .rating)
        self.summary = try container.decode(String.self, forKey: .summary)
    }
    
    public init(id: Int, name: String,
                type: String,
                language: String,
                genres: [String],
                image: TVShowTO.ImageTO,
                rating: TVShowTO.RatingTO,
                summary: String) {
        self.id = id
        self.name = name
        self.type = type
        self.language = language
        self.genres = genres
        self.image = image
        self.rating = rating
        self.summary = summary
    }
}

extension TVShowTO {
    
    struct ImageTO: Codable {
        
        let original: String
        let medium: String
        
        private enum CodingKeys: String, CodingKey {
            case original = "original"
            case medium = "medium"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.original = try container.decode(String.self, forKey: .original)
            self.medium = try container.decode(String.self, forKey: .medium)
            
        }
        
        public init(original: String, medium: String) {
            self.original = original
            self.medium = medium
        }
    }
    
    struct RatingTO: Codable {
        let average: Float?
        
        private enum CodingKeys: String, CodingKey {
            case average = "average"
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.average = try container.decode(Float?.self, forKey: .average)
        }
        
        public init(average: Float) {
            self.average = average
        }
    }
}
