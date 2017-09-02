//
//  FirstViewController.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import UIKit

class NRNovelChapterViewController: NRBaseTableViewController {
    
    var novel: NovelObject?
    
    var novelDescView: NRNovelDescriptionView? = NRNovelDescriptionView.fromNib() as? NRNovelDescriptionView
    
    override func class_TableViewStyle() -> UITableViewStyle { return .grouped }
    
    override func class_TableViewEdgeOffsets() -> FTEdgeOffsets { return FTEdgeOffsets(10, 0, 10, 0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = true
        
        self.baseView?.backgroundColor = "#f7f3f0".hexColor()

        setupToolBar()

        tableView.backgroundColor = .clear
        tableView.register(NRNovelTableViewCell.getNIBFile(), forCellReuseIdentifier: "kNovelCellIdentifer")
        
//        novel = NovelObject(urlString: (Bundle.main.path(forResource: "EmperorsDomination", ofType: "html")!))
        
        if let url = novel?.urlString {
            
            NovelOnlineParser.getNovelChapters(url, completionHandler: { (value: [String : Any]) in
                self.configureContent(value: value)
            })
        }
    }
    
    func configureContent(value: [String : Any]) {
        
        NovelOnlineParser.getNovelChapters(&self.novel!, details: value)
        
        self.novelDescView?.configureContent(novel: self.novel!)
        self.tableView.setTableHeaderView(view: self.novelDescView)
        self.tableView.reloadData()
    }
}

extension NRNovelChapterViewController {
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return novel?.chapterList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "kNovelCellIdentifer", for: indexPath)
        
        if
            let cell = cell as? NRNovelTableViewCell,
            let cur = novel?.chapterList?[indexPath.section] {
            cell.configureContent(novel: cur)
        }
        
        return cell
    }
}

extension NRNovelChapterViewController {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cur = novel?.chapterList?[indexPath.section] {
            self.performSegue(withIdentifier: "kShowNovelReaderView", sender: cur)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "kShowNovelReaderView" {
            if let nextViewController = segue.destination as? NRReaderViewController{
                nextViewController.novel = sender as? NovelChapter
            }
        }
    }
}

extension NRNovelChapterViewController {
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupToolBar() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(back))
        
        let searchBar = FTSearchBar(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 44)), textColor: .white)
        searchBar.configure(barTintColor: "#de6161".hexColor()!, tintColor: .white)
        searchBar.placeholder = "Search"
        
        self.navigationItem.titleView = searchBar
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)
    }
    
    //    func setupToolBar() {
    //
    //        let refresh = UIRefreshControl();
    //        refresh.addTarget(self, action: #selector(setupSearchBar), for: .valueChanged)
    //        self.tableView.addSubview(refresh)
    //        self.tableViewController.refreshControl = refresh
    //    }
}