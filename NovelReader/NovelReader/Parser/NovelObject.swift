//
//  NovelObject.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation
import SwiftSoup

open class Novels {
    
    var baseUrlString: String = "https://novelonlinefree.info/novel_list"

    var novelList: [NovelObject] = []
    
    var type: String? = "topview"
    var category: String? = "all"
    var state: String? = "completed"
    var page: IntMax = 1
    
    var totalList: IntMax = 0
    
    init(urlString: String) {
        self.baseUrlString = urlString
    }
}

open class NovelObject {
    
    var urlString: String = "__urlString"
    
    var title: String? = " "
    var lastChapter: String? = "__lastChapter"
    var imageURL: String? = " "

    var contentDesc: String? = " "
    var views: String? = "__views"
    var lastUpdated: String? = "__lastUpdated"
    
    var keyworkds: [String]? = []

    var chapterList: [NovelChapter]?

    init(urlString: String) {
        self.urlString = urlString
    }
}

open class NovelChapter {
    
    var url: String = "__urlString"
    var title: String? = "__title"
    var shortTitle: String? = "__shorttitle"
    var releaseDate: String? = "__releaseDate"
    
    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}
