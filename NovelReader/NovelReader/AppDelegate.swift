//
//  AppDelegate.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 20/08/17.
//  Copyright © 2017 Praveen Prabhakar. All rights reserved.
//

import UIKit

@UIApplicationMain
class NRAppDelegate: FTAppDelegate {

    open override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]?) -> Bool {
        
        setAppTheme()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func setAppTheme() {
        
        FTReflection.registerBundleIdentifier([NRAppDelegate.self,FTBaseView.self])

        if
            let theme = Bundle.main.path(forResource: "Themes", ofType: "json"),
            let themeContent = try? theme.JSONContentAtPath() as! FTThemeDic {
            
            FTThemesManager.setupThemes(themes: themeContent, imageSourceBundle: NRAppDelegate.self)
        }
        
        let navigationBarAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        navigationBarAppearance.barTintColor = .white
        navigationBarAppearance.tintColor = .white
//        navigationBarAppearance.isTranslucent = false
        
        UINavigationBar.applyBackgroundImage(navigationBar: navigationBarAppearance, defaultImage: #imageLiteral(resourceName: "Pixel"))
        //Remove Bottom 1px image
        navigationBarAppearance.shadowImage = UIImage()
        
        let toolBarAppearance = UIToolbar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        toolBarAppearance.barTintColor = .white
        toolBarAppearance.isTranslucent = true
        
        let segmentedControlAppearance = UISegmentedControl.appearance()
        segmentedControlAppearance.tintColor = #imageLiteral(resourceName: "Pixel").getColor()
        
        let extoolBarAppearance = UISegmentedControl.appearance(whenContainedInInstancesOf: [UICollectionReusableView.self])
        extoolBarAppearance.tintColor = .white
        
//        let textBarAppearance = UILabel.appearance(whenContainedInInstancesOf: [FTSearchBar.self])
//        textBarAppearance.tintColor = .blue
        
    }
    
//    lazy public var floatingButton : FTFloatingView = {
//        
//        let normalButton: FTButton = FTButton(type: .custom)
//        normalButton.setImage(#imageLiteral(resourceName: "upArrow"), for: .normal)
//        normalButton.imageView?.isUserInteractionEnabled = true
//        normalButton.backgroundColor = .clear
//        
//        normalButton.addTarget(self, action: #selector(NRAppDelegate.tappedV), for: .touchUpInside)
//        
//
//        normalButton.frame = CGRect(x: 170, y:  320, width: 30, height: 30)
//
//        var floatingView = FTFloatingView(with: normalButton)
//    
//        
//        return floatingView
//    }()
//    
//    func tappedV() {
//        
//    }
}

