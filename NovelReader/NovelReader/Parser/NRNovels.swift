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
