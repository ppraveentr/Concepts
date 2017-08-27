//
//  NRReaderViewController.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 26/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

class NRReaderViewController: FTBaseViewController {
    
    var novel: NovelChapter?
    
    @IBOutlet var fontPickerBarItem: UIBarButtonItem?
    @IBOutlet var chapterToolBarItem: UIToolbar?
    var aray: [UIBarButtonItem]?

    var textSize: Int = 140
    
    let contentView = FTContentView()

    override func loadView() {
        super.loadView()
        
        aray = self.chapterToolBarItem?.items?.sorted(by: { $0.tag > $1.tag })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.baseView?.backgroundColor = "#f7f3f0".hexColor()
        
        self.setupViewContent()
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupViewContent() {
        
        self.title = novel?.shortTitle ?? novel?.title
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        
        self.navigationItem.rightBarButtonItem = fontPickerBarItem

        self.mainView?.pin(view: contentView)

        if let url = novel?.url {
            NovelOnlineParser.parseNovelReader(url, completionHandler: { (html) in
                self.loadWebContent(contnet: html)
            })
        }
    }
    
    func loadWebContent(contnet: String) {
        contentView.webView.loadHTMLString("<html><meta name=\"viewport\" content=\"initial-scale=1.0\" /><body>\(contnet)</body></html>", baseURL: nil)
    }
}

extension NRReaderViewController: FTFontPickerViewProtocal {

    func getBodyText() -> String {
        return "document.getElementsByTagName('body')[0]"
    }

    func fontSize(_ size: FontSizePicker) {
        
        if size == .increment {
            textSize += 10
        }else {
            textSize -= 10
        }
    
        if textSize >= 10 {
            let js = self.getBodyText() + ".style.webkitTextSizeAdjust= '\(textSize)%'"
            self.insertCSSString(jsString: js)
        }
    }
    
    func pickerColor(textColor: UIColor, backgroundColor: UIColor) {
        
        let bgJS = self.getBodyText() + ".style.backgroundColor= \"" + backgroundColor.hexColor() + "\";"
        self.insertCSSString(jsString: bgJS)
        
        let fontJS = self.getBodyText() + ".style.color= \"" + textColor.hexColor() + "\";"
        self.insertCSSString(jsString: fontJS)
    }
    
    func fontColorSelected(_ fontColor: UIColor) {
        
        let js = self.getBodyText() + ".style.backgroundColor= \"" + fontColor.hexColor() + "\";"

        self.insertCSSString(jsString: js)
    }
    
    func fontFamily(_ fontName: String?) {
        
        //base document style
        var css = self.getBodyText() + ".style.fontFamily= \""
        
        //user selected font
        css += ( (fontName != nil && fontName != "") ? "\(fontName!)," : "")
        
        //Default font
        css += "-apple-system\";"
        
        self.insertCSSString(jsString: css)
    }
    
    func insertCSSString(jsString: String) {
        contentView.webView.evaluateJavaScript(jsString, completionHandler: nil)
    }
}

extension NRReaderViewController: UIPopoverPresentationControllerDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue for the popover configuration window
        if segue.identifier == "kShowFontPicker" {
            if let controller = segue.destination as? FTFontPickerViewController {
                controller.fontPickerViewDelegate = self
                controller.popoverPresentationController!.delegate = self
                controller.preferredContentSize = CGSize(width: 250, height: 320)
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

}
