struct NovelChapter: FTModelData {
    var shortTitle: String = ""
    var title: String = ""
    var url: String = ""
    var releaseDate: String = ""
    
    
    /* Coding Keys */
    enum CodingKeys: String, CodingKey  {
        
        case shortTitle
        case title
        case url
        case releaseDate
        
    }
    
    /* Decoder */
    init(from decoder: Decoder) throws {
        
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        if let value = try container?.decodeIfPresent(String.self, forKey: .shortTitle) {
            self.shortTitle = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .title) {
            self.title = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .url) {
            self.url = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .releaseDate) {
            self.releaseDate = value
        }
        
    }
    
    /* Encoder */
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        if !shortTitle.isEmpty {
            try container.encode(shortTitle, forKey: .shortTitle)
        }
        if !title.isEmpty {
            try container.encode(title, forKey: .title)
        }
        if !url.isEmpty {
            try container.encode(url, forKey: .url)
        }
        if !releaseDate.isEmpty {
            try container.encode(releaseDate, forKey: .releaseDate)
        }
        
    }
    
}

