//
//  FTCollectionViewController.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 21/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import Foundation

class NRNovelCollectionHeaderView: UICollectionReusableView {

    var segmentedControl: FTSegmentedControl? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSegmentView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setupSegmentView()
    }
    
    func setupSegmentView() {
        
        segmentedControl = FTSegmentedControl(items: [ "Recent Update", "Top Views" ]) { (segment) in
                print(segment)
        };

        self.backgroundColor = "#df6e6e".hexColor()
        self.pin(view: segmentedControl!, withEdgeOffsets: FTEdgeOffsets(10))
    }

    
}

class NRNovelCollectionViewController: NRBaseViewController {

    lazy var collectionView: UICollectionView = self.getCollectionView()
    lazy var sampleCell: NRNovelCollectionViewCell = self.getSampleCell()

//    lazy var novel: NRNovels = NRNovels(urlString: "https://novelonlinefree.info/novel_list")
    var novel: NRNovels? = NRNovels()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchNovelList()
    }
    
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
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.backgroundView?.backgroundColor = .clear
        
        return collectionView
    }
    
    func fetchNovelList() {
        NRServiceProvider.fetchRecentUpdateList(novel: self.novel) { (novelList) in
            if(novelList != nil) {
                self.novel = novelList
            }
            self.setUpColletionView()
        }
    }

    func setUpColletionView() {

        guard collectionView.superview == nil else { return }

        collectionView.register(NRNovelCollectionViewCell.getNIBFile(),
                                forCellWithReuseIdentifier: "kNovelCellIdentifer")

        collectionView.register(NRNovelCollectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                withReuseIdentifier: "headerCell")

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear

        self.mainView?.pin(view: collectionView)
        self.collectionView.reloadData()
    }
}

extension NRNovelCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerCell", for: indexPath) as! NRNovelCollectionHeaderView

        headerView.segmentedControl?.handler = { [unowned self] (sender) in
            self.fetchNovelList()
        }

        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return novel?.novelList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kNovelCellIdentifer", for: indexPath)

        if let cur = novel?.novelList?[indexPath.row],
            let cell = cell as? NRNovelCollectionViewCell {
           cell.configureContent(novel: cur)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let cur = novel?.novelList?[indexPath.row] {
            sampleCell.configureContent(novel: cur)
        }
        
        return sampleCell.getSize(baseView: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cur = novel?.novelList?[indexPath.row]
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
                nextViewController.novel = sender as? NRNovel
            }
        }
        else if segue.identifier == "kShowNovelReaderView" {
            if let nextViewController = segue.destination as? NRReaderViewController {
                nextViewController.novel = sender as? NRNovelChapter
            }
        }
    }
    
    func setUpFloatingView() {
        
//        let floatingView = (UIApplication.shared.delegate as? NRAppDelegate)?.floatingButton
        
//        floatingView?.show()
        
//        var novels = NRNovelChapter(title: "title", url: (Bundle.main.path(forResource: "EmperorDominationChapter", ofType: "html")!))
//        NRServiceProvider.parseNovelReader(&novels)
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
