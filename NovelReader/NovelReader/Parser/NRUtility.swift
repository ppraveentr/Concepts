//
//  NRUtility.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation
import SwiftSoup

public extension Element {
    
    //Get content of keyPair value
    /* 
     *  [["value":"description"], ["key":"content"]] : Gets value of <content>
     *  <meta name="description" content="Read Emperor’s Domination Chapter 874 online for free at Novelonlinefree.com."/>
     *
     *  [["key":"src"]] : Gets value of <src>
     *  <img width="90" height="130" src="http://someURL" alt="Death Sutra">
     */
    func getProperty(forKeyPair keyPair: [Dictionary<String, String>]) -> String? {
        
        var keyPair = keyPair
        var atts: [Attribute]? = self.getAttributes()?.asList()
        
        let bloc =  { (searchPair: Dictionary<String, String>, searchAtt: [Attribute]) -> [Attribute] in
            
            var req: [Attribute] = []
            
            searchPair.forEach { (key, value) in
                
                let foundAtt = searchAtt.filter({ (att) -> Bool in
                    
                    if (key == "key") {
                        return att.getKey() == value
                    }else if (key == "value") {
                        return att.getValue() == value
                    }
                    
                    return false
                })
                
                req.append(contentsOf: foundAtt)
            }
            
            return req
        }
        
        var found: [Attribute] = bloc(keyPair.first!, atts!)
        
        found.forEach { (att) in
            atts?.remove(at: (atts?.index(of: att))!)
        }
        
        _ = keyPair.remove(at: 0)
        
        if found.count > 0 {
            keyPair.forEach { (dic) in
                found = bloc(dic, atts!)
            }
        }
                
        return found.first?.getValue()

//        let atts: [Attribute]? = self.getAttributes()?.asList()
//        
//        let req = atts?.filter({ (att) -> Bool in
//            return att.getValue() == key.keys.first
//        })
//        
//        if
//            let req = req, req.count > 0,
//            key.values.first != "" {
//            
//            let actualValue = atts?.filter({ (att) -> Bool in
//                return att.getKey() == key.values.first
//            })
//            
//            return actualValue?.first?.getValue()
//            
//        }
//        
//        return nil
    }

    
    //Removes TextNode - object from list, while skiping elements having child-class-element "skipClass"
    func getChildElement(filterWithType classType: String? = nil, skipClass: String? = nil) -> [Element] {
        
        var elm: [Element] = []
        
        let filterSkipElementes = { (subE: Element) in
            
            if skipClass != nil {
                if try! subE.getElementsByClass(skipClass!).array().count == 0 {
                    elm.append(subE)
                }
            }else{
                elm.append(subE)
            }
        }
        
        let filterSubElementes = { (subE: Element) in
            
            if classType != nil {
                if try! subE.getElementsByClass(classType!).array().count > 0 {
                    filterSkipElementes(subE)
                }
            }
            else {
                filterSkipElementes(subE)
            }
        }
        
        for subE in self.getChildNodes() where ((subE as? Element) != nil) {
            if let subE = subE as? Element {
                filterSubElementes(subE)
            }
        }
        
        return elm
    }
    
    func updateChapterDetails(chapter: inout NovelChapter) {
        
        for spans in self.getChildNodes() where ((spans as? Element) != nil) {
            
            if let spans = spans as? Element {
                
                if
                    let shortTitle: String = try! spans.select("span").select("a").getText(),
                    (shortTitle.length > 0) {
                    chapter.shortTitle = shortTitle
                }
                else if
                    let releaseDate: String = try! spans.select("span").getText(),
                    (releaseDate.length > 0) {
                    chapter.releaseDate = releaseDate
                }
                
            }
        }
    }
    
}

public extension Elements {
    
    func getProperty(forKeyPair key: [Dictionary<String, String>]) -> String? {
        
        var value: String?
        
        for elem in self.array() {
            
            if let val = elem.getProperty(forKeyPair: key) {
                value = val
                break
            }
        }
        
        return value
    }
    
    func getText() -> String? {
        
        var title = ""
        
        do {
            
            if let element: Element = self.first() {
                title = try element.text()
            }
        }
        catch Exception.Error(_, let message) { print(message) }
        catch { print("error") }
        
        return title
    }
    
    func getImageURL() -> String? {
        
        var imageURL = ""
        
        do {
             if let element: Element = self.first() {
                
                for imageE in element.getChildElement() where (imageE.tagName() == "img") {
                    
                    imageURL = imageE.getProperty(forKeyPair: [["key":"src"]]) ?? ""
                    
                    if imageURL != "" {
                        break
                    }
                }
            }
            
        }
            //catch Exception.Error(_, let message) { print(message) }
        //catch { print("error") }
        
        return imageURL
    }
    
    func getChapterList() -> [NovelChapter] {
        
        var chapters: [NovelChapter] = []
        
        if let element: Element = self.first() {
            
            for chapter in element.getChildNodes() where ((chapter as? Element) != nil) {
                
                if let chapter = chapter as? Element {
                    
                    let url: String = try! chapter.select("a").attr("href")
                    let title: String = try! chapter.select("a").attr("title")
                    
                    var chap = NovelChapter(title: title, url: url)
                    chapter.updateChapterDetails(chapter: &chap)
                    
                    chapters.append(chap)
                }
            }
        }
        
        return chapters
    }
}
