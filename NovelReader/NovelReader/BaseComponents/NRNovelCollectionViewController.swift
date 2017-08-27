//
//  FTCollectionViewController.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 21/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

class NRNovelCollectionHeaderView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSegmentView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setupSegmentView()
    }
    
    func setupSegmentView() {
        
        let segmentedControl = UISegmentedControl(items: [ "Hi", "wel" ])
        
        self.backgroundColor = "#df6e6e".hexColor()
        self.pin(view: segmentedControl, withEdgeOffsets: FTEdgeOffsets(10))
    }
}

class NRNovelCollectionViewController: NRBaseViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    lazy var collectionView: UICollectionView = self.getCollectionView()
    
    lazy var novel: Novels = Novels(urlString: "https://novelonlinefree.info/novel_list")

    lazy var sampleCell: NRNovelCollectionViewCell = self.getSampleCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.parseNovel()
        
        self.view.backgroundColor = "#f7f3f0".hexColor()
        
        collectionView.register(NRNovelCollectionViewCell.getNIBFile(),
                                forCellWithReuseIdentifier: "kNovelCellIdentifer")
        
        collectionView.register(NRNovelCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerCell")  // UICollectionReusableView

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clear

        self.mainView?.pin(view: collectionView)
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
////        if let navigationController = self.navigationController as? ScrollingNavigationController {
////            navigationController.followScrollView(tableView, delay: 50.0)
////        }
//    }
    
    func getflowLayout() -> UICollectionViewFlowLayout {
        
        let layout = UICollectionViewFlowLayout()
        
        layout.headerReferenceSize = CGSize(width:0, height:45)
        layout.footerReferenceSize = .zero
        
        layout.sectionInset = UIEdgeInsets(top: 15, left: 20, bottom: 10, right: 20)
        
        layout.sectionHeadersPinToVisibleBounds = true
        
        return layout
    }
}

extension NRNovelCollectionViewController {
 
    func getCollectionView() -> UICollectionView {
        let flow = self.getflowLayout()
        
        return UICollectionView(frame: .zero, collectionViewLayout: flow)
    }
    
    func parseNovel() {
        //(Bundle.main.path(forResource: "Novellist", ofType: "html")!)
        
        NovelOnlineParser.parseNovelList(novel.baseUrlString, completionHandler: { (novelList) in
            self.novel.novelList.append(contentsOf: novelList)
            self.collectionView.reloadData()
        })
    }
}

extension NRNovelCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusableView : UICollectionReusableView? = nil

        if kind == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! NRNovelCollectionHeaderView

            reusableView = headerView
        }
        
        return reusableView!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return novel.novelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kNovelCellIdentifer", for: indexPath)
        
        let cur = novel.novelList[indexPath.row]
        
        if let cell = cell as? NRNovelCollectionViewCell {
           cell.configureContent(novel: cur)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cur = novel.novelList[indexPath.row]
        sampleCell.configureContent(novel: cur)
        
        return sampleCell.getSize(baseView: collectionView)
    }
}

extension NRNovelCollectionViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cur = novel.novelList[indexPath.row]

        self.performSegue(withIdentifier: "kShowNovelChapterList", sender: cur)
    }
}

extension NRNovelCollectionViewController {
    
    func getSampleCell() -> NRNovelCollectionViewCell {
        return NRNovelCollectionViewCell.fromNib() as! NRNovelCollectionViewCell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "kShowNovelChapterList" {
            if let nextViewController = segue.destination as? NRNovelChapterViewController {
                nextViewController.novel = sender as? NovelObject
            }
        }
        else if segue.identifier == "kShowNovelReaderView" {
            if let nextViewController = segue.destination as? NRReaderViewController {
                nextViewController.novel = sender as? NovelChapter
            }
        }
    }
    
    func setUpFloatingView() {
        
//        let floatingView = (UIApplication.shared.delegate as? NRAppDelegate)?.floatingButton
        
//        floatingView?.show()
        
//        var novels = NovelChapter(title: "title", url: (Bundle.main.path(forResource: "EmperorDominationChapter", ofType: "html")!))
//        NovelOnlineParser.parseNovelReader(&novels)
//
//        self.performSegue(withIdentifier: "kShowNovelReaderView", sender: novels)

        
//        NotificationCenter.default.addObserver(forName: .FTMobileCoreUI_ViewController_DidAppear, object: self, queue: nil) { (not) in
//            
//        }
//        
//        NotificationCenter.default.addObserver(forName: .FTMobileCoreUI_ViewController_WillDisappear, object: self, queue: nil) { (not) in
//            
//        }
    }
}
