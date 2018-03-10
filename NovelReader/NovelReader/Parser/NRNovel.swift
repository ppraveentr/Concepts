//
//  NRNovelObject.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

struct NRNovels {
    
    var baseUrlString: String = "https://novelonlinefree.info/novel_list"

    var novelList: [NRNovel] = []
    
    var type: String? = "topview"
    var category: String? = "all"
    var state: String? = "completed"
    var page: Int64 = 1
    
    var totalList: Int64 = 0
    
    init(urlString: String) {
        self.baseUrlString = urlString
    }
}

struct NRNovel: FTDataModel {
    var identifer: String = ""
    var lastChapter: String = ""
    var imageURL: String = ""
    var chapterList: [NovelChapter] = []
    var contentDescription: String = ""
    var views: String = ""
    var keyworkds: [String] = []
    var searchString: String = ""
    var title: String = ""
    var author: String = ""
    var lastUpdated: String = ""
    
    /* Coding Keys */
    enum CodingKeys: String, CodingKey  {
        
        case identifer = "id"
        case lastChapter = "lastchapter"
        case imageURL = "image"
        case chapterList = "chapterList"
        case contentDescription = "description"
        case views = "view"
        case keyworkds = "keyworkds"
        case searchString = "nameunsigned"
        case title = "name"
        case author = "author"
        case lastUpdated = "updatetime"
        
    }
    
    /* Decoder */
    init(from decoder: Decoder) throws {
        
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        
        if let value = try container?.decodeIfPresent(String.self, forKey: .identifer) {
            self.identifer = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .lastChapter) {
            self.lastChapter = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .imageURL) {
            self.imageURL = value
        }
        if let value = try container?.decodeIfPresent([NovelChapter].self, forKey: .chapterList) {
            self.chapterList = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .contentDescription) {
            self.contentDescription = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .views) {
            self.views = value
        }
        if let value = try container?.decodeIfPresent([String].self, forKey: .keyworkds) {
            self.keyworkds = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .searchString) {
            self.searchString = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .title) {
            self.title = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .author) {
            self.author = value
        }
        if let value = try container?.decodeIfPresent(String.self, forKey: .lastUpdated) {
            self.lastUpdated = value
        }
        
    }
    
    /* Encoder */
    func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if identifer != nil {
            try container.encode(identifer, forKey: .identifer)
        }
        if lastChapter != nil {
            try container.encode(lastChapter, forKey: .lastChapter)
        }
        if imageURL != nil {
            try container.encode(imageURL, forKey: .imageURL)
        }
        if chapterList != nil {
            try container.encode(chapterList, forKey: .chapterList)
        }
        if contentDescription != nil {
            try container.encode(contentDescription, forKey: .contentDescription)
        }
        if views != nil {
            try container.encode(views, forKey: .views)
        }
        if keyworkds != nil {
            try container.encode(keyworkds, forKey: .keyworkds)
        }
        if searchString != nil {
            try container.encode(searchString, forKey: .searchString)
        }
        if title != nil {
            try container.encode(title, forKey: .title)
        }
        if author != nil {
            try container.encode(author, forKey: .author)
        }
        if lastUpdated != nil {
            try container.encode(lastUpdated, forKey: .lastUpdated)
        }
        
    }
    
}


struct NovelChapter: FTDataModel {
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
        if shortTitle != nil {
            try container.encode(shortTitle, forKey: .shortTitle)
        }
        if title != nil {
            try container.encode(title, forKey: .title)
        }
        if url != nil {
            try container.encode(url, forKey: .url)
        }
        if releaseDate != nil {
            try container.encode(releaseDate, forKey: .releaseDate)
        }
        
    }
    
}
