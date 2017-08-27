//
//  NovelOnlineParser.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation
import SwiftSoup

class NovelOnlineParser: NSObject {
    
    //Get list of all Novels
    class func parseNovelList(_ url: String, completionHandler: @escaping (_ novelsList: [NovelObject]) -> Swift.Void) {
        
        var novelList: [NovelObject] = []
        
        let parse = { (html: String) in
            
            let doc: Document = try! SwiftSoup.parse(html)
            
            //Get dom Element for the novelList
            if let element: Element = try! doc.getElementsByClass("danh_sach").first() {
                
                //For each novelElement, skip "clearfix"
                for novel in element.getChildElement(filterWithType: "update_item") {
                    
                    //Create novel object
                    let nov = self.parseNovelObject(element: novel)
                    
                    novelList.append(nov)
                }
            }
            
            //Send it main object
            DispatchQueue.main.async() { () -> Void in
                completionHandler(novelList)
            }
        }
        
        getContentFromURLString(url, completionHandler: { (html) in
            parse(html)
        })

    }
    
    //Get list of all chapters from a single NovelObject
    class func getNovelChapters(_ urlString: String, getChapters: Bool = true, completionHandler: @escaping (_ novelsList: [String:Any]) -> Swift.Void) {

        let parse = { (html: String) in
            
            let doc: Document = try! SwiftSoup.parse(html)
            
            var valye: [String:Any] = [:]
            
            //novel "title"
            if let element: Elements = try? doc.getElementsByClass("entry-title") {
                valye["title"] = element.getText()
            }
            
            //novel cover Image
            if let element: Elements = try? doc.getElementsByClass("info_image") {
                valye["imageURL"] = element.getImageURL()
            }
            
            //Get Novel Chapter list, if needed
            if getChapters,
                let element: Elements = try? doc.getElementsByClass("chapter-list") {
                valye["chapterList"] = element.getChapterList()
            }
            
            //Get novel 'description' from meta-tag
            if let metaTags: Elements = try? doc.getElementsByTag("meta") {
                
                if let value = metaTags.getProperty(forKeyPair: [["value":"description"], ["key":"content"]]) {
                    valye["contentDesc"] = value
                }
            }
            
            if let element: Element = try! doc.getElementById("noidungm") {
                
                if var desc: String = try? element.getAllElements().getText() ?? "", desc.length > 0 {
               
                    if let heading = try? element.select("h2"), let text = try? heading.text()  {
                        desc.trimPrefix(text)
                        desc.trimPrefix(" ")
                    }
                    
                    if let prev = valye["contentDesc"] as? String, desc.length > prev.length {
                        valye["contentDesc"] = desc
                    }
                }
            }
            
            //Send it main object
            DispatchQueue.main.async() { () -> Void in
                completionHandler(valye)
            }
        }
        
        getContentFromURLString(urlString, completionHandler: { (html) in
            parse(html)
        })
    }
    
    //Get list of all chapters from a single NovelObject
    class func getNovelChapters(_ novel: inout NovelObject, details: [String: Any]) {
        
        if let value = details["title"] as? String {
            novel.title = value
        }
        
        if let value = details["imageURL"] as? String {
            novel.imageURL = value
        }
        
        if let value = details["chapterList"] as? [NovelChapter] {
            novel.chapterList = value
        }
        
        if let value = details["contentDesc"] as? String {
            novel.contentDesc = value
        }
    }
    
    //Get chapter content
    class func parseNovelReader(_ url: String, completionHandler: @escaping (_ chapterContent: String) -> Swift.Void) {
        
        let parse = { (html: String) in
            
            let doc: Document = try! SwiftSoup.parse(html)
            
            var content = ""
            
            //Get chapter content
            if let element: Elements = try? doc.getElementsByClass("vung_doc"),
                let htmlText = try? element.html() {
                content = htmlText
            }
            
            //Send it main object
            DispatchQueue.main.async() { () -> Void in
                completionHandler(content)
            }
        }
        
        getContentFromURLString(url) { (html) in
            parse(html)
        }
    }
}

fileprivate extension NovelOnlineParser {
    
    class func getContentFromURLString(_ string: String,
                                       completionHandler: @escaping (_ html : String) -> Swift.Void) {
        
        if string.hasPrefix("http") {
            
            let myURL = URL(string: string)
            
            let encodingList = [String.Encoding.utf8, String.Encoding.macOSRoman]
            
            self.getContentFromURL(myURL!, encodingList: encodingList, completionHandler: { (htmlString) in
                completionHandler(htmlString)
            })
            
            return
        }
        
        let html: String = try! String(contentsOfFile: string)
        
        completionHandler(html)
    }
    
    class func getContentFromString(_ string: String) -> String {
        
        if string.hasPrefix("http") {
            
            let myURL = URL(string: string)
            
            var html: String = ""
            
            let encodingList = [String.Encoding.utf8, String.Encoding.macOSRoman]

            for type in encodingList {
                
                do{
                    html = try String(contentsOf: myURL!, encoding: type)
                    break
                    // file could be read properly - do something with the content ...
                } catch {
                    let nsError = error as NSError
                    print(nsError.localizedDescription)
                }
            }
            
            return html
        }
        
        let html: String = try! String(contentsOfFile: string)
        
        return html
    }
    
    fileprivate class func getContentFromURL(_ url: URL, encodingList: [String.Encoding], completionHandler: @escaping (String) -> Swift.Void) {
        
        let decodeData = { (data: Data) in
            
            var html: String? = ""
            
            //Try to decode the String
            for type in encodingList {
                html = String(bytes: data, encoding: type)
                if html != nil {
                    break
                }
            }
            
            //Send it main object
            DispatchQueue.main.async() { () -> Void in
                completionHandler(html ?? "")
            }
        }
        
        //Get content from Net
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data, error == nil
                else { return }
            
            decodeData(data)
            
            }.resume()
        
    }
    
    class func parseNovelObject(element: Element) -> NovelObject {
        
        /*
         <div class="update_item list_category" title="Dark Blood Age">
            <a rel="nofollow" href="http://novelonlinefree.info/novel/dark_blood_age" title="Dark Blood Age">
                <img src="http://3.bp.blogspot.com/-t2aRQ_6zKms/WIhot_6pR2I/AAAAAAAAFpc/oaBUwf-3noA/s0/58880647e051c.jpg" alt="Dark Blood Age" title="Dark Blood Age">
            </a>
            <h3 class="nowrap">
                <a href="http://novelonlinefree.info/novel/dark_blood_age" title="Dark Blood Age">Dark Blood Age</a>
            </h3>
            <a href="http://novelonlinefree.info/chapter/dark_blood_age/chapter_158" title="Dark Blood Age Chapter 120" class="chapter">
                Chapter 120
            </a>
            <span>Last updated : 20-Aug-2017 13:36</span>
            <span>View : 45,201</span>
         </div>
         */
        let nov = NovelObject(urlString: "")
        
        for novelElement in element.getChildElement() {
            
            let updateTitle = { (subElement: Element) in
                
                if nov.title == " " || nov.title == "" || nov.title == nil  {
                    nov.title = try! subElement.attr("title")
                }
            }
            
            //Get imageURL and actualChapter URL
            for subElement in novelElement.getChildElement() {
                
                if subElement.tagName() == "img" {
                    nov.imageURL = try! subElement.attr("src")
                    updateTitle(subElement)
                }
                else if subElement.tagName() == "a" {
                    nov.urlString = try! subElement.attr("href")
                    updateTitle(subElement)
                }
            }
            
            //Get chapter's views and last chapter details
            if let text = try! novelElement.select("span").getText() {
                
                if text.hasPrefix("Last updated : ") {
                    nov.lastUpdated = text
                }
                else if text.hasPrefix("View : ") {
                    nov.views = text.trimming(string: "View : ")
                }
            }
            
            //Get list of chapters
            if
                let text: String = try! novelElement.getElementsByClass("chapter").getText(),
                (text.length > 0 ) {
                nov.lastChapter = text.trimming(string: nov.title ?? "")
            }
        }
        return nov
    }
}
