//
//  NRNovelObject.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

final class NRNovels: FTModelData {
    //TODO: Yet to setup model creator for Static data
    var state: String? = "completed"
    var novelList: [NRNovel]? = [NRNovel()]
    var page: String? = "1"
    var totalItems: String? = "1"
    var type: String? = "topview"
    var category: String? = "all"

    /* Coding Keys */
    enum CodingKeys: String, CodingKey  {
        case state
        case novelList
        case page
        case totalItems
        case type
        case category

    }
}
