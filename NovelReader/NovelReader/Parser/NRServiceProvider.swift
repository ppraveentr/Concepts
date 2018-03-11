//
//  NRServiceProvider.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

class NRServiceProvider {
    
//    static let fetchNovelList = "http://127.0.0.1:3000/users?jhj";
    static let _recentUpdateList = {
        return Bundle.main.path(forResource: "Novellist", ofType: "json")!
    };
    
    static func nonvelChaptersList(novel: NRNovel) -> String {
        return Bundle.main.path(forResource: "Novellist", ofType: "json")!
    };
    
    //Get list of all Novels
    class func fetchRecentUpdateList(_ completionHandler: @escaping (_ novelsList: [NRNovel]) -> Swift.Void) {
        
        let parse = { (html: Data) in
            let novelList: [NRNovel] = try! FTModelObject.createDataModel(ofType: [NRNovel].self, fromJSON: html)
            completionHandler(novelList)
        }
        
        FTServiceClient.getContentFromURL(_recentUpdateList(), completionHandler: { (htmlString, data, httpURLResponse) in
            parse(data)
        })
    }
    
    //Get list of all chapters from a single NRNovelObject
    class func getNovelChapters(_ novel: NRNovel, getChapters: Bool = true,
                                completionHandler: @escaping (_ novelsList: JSON) -> Swift.Void) {

        let parse = { (html: String) in
            let valye: JSON = [:]
            completionHandler(valye)
        }
        
        FTServiceClient.getContentFromURL(self.nonvelChaptersList(novel: novel), completionHandler: { (htmlString, data, httpURLResponse) in
            parse(htmlString)
        })
    }
    
    //Get list of all chapters from a single NRNovelObject
    class func getNovelChapters(_ novel: inout NRNovel, details: JSON) {
        
        if let value = details["title"] as? String {
            novel.title = value
        }
        
        if let value = details["imageURL"] as? String {
            novel.imageURL = value
        }
        
        if let value = details["chapterList"] as? [NovelChapter] {
            novel.chapterList = value
        }
        
        if let value = details["contentDescription"] as? String {
            novel.contentDescription = value
        }
    }
    
    //Get chapter content
    class func parseNovelReader(_ url: String,
                                completionHandler: @escaping (_ chapterContent: String) -> Swift.Void) {
        
        let parse = { (html: String) in
            completionHandler("")
        }
        
        FTServiceClient.getContentFromURL(url) { (htmlString, data, httpURLResponse) in
            parse(htmlString)
        }
    }
}
