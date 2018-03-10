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
        
        FTDataModelCreator.configureSourcePath(path: Bundle.main.path(forResource: "NRDataModel", ofType: "json")!);
        FTDataModelCreator.generateOutput()
        
        setAppTheme()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func setAppTheme() {

        if
            let theme = Bundle.main.path(forResource: "Themes", ofType: "json"),
            let themeContent = try? theme.JSONContentAtPath() as! FTThemeDic {
            
            FTThemesManager.setupThemes(themes: themeContent, imageSourceBundle: [NRAppDelegate.self])
        }
        
        let navigationBarAppearance = UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
//        navigationBarAppearance.barTintColor = .white
//        navigationBarAppearance.tintColor = .white
//        navigationBarAppearance.isTranslucent = false
        
        UINavigationBar.applyBackgroundImage(navigationBar: navigationBarAppearance, defaultImage: #imageLiteral(resourceName: "Pixel"))
//        //Remove Bottom 1px image
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.titleTextAttributes = [.foregroundColor : UIColor.white]

        let toolBarAppearance = UIToolbar.appearance(whenContainedInInstancesOf: [UINavigationController.self])
        toolBarAppearance.barTintColor = .white
        toolBarAppearance.isTranslucent = true
        
//        let segmentedControlAppearance = UISegmentedControl.appearance()
//        segmentedControlAppearance.tintColor = #imageLiteral(resourceName: "Pixel").getColor()
        
        let extoolBarAppearance = UISegmentedControl.appearance(whenContainedInInstancesOf: [UICollectionReusableView.self])
        extoolBarAppearance.tintColor = .white
        
//        let textBarAppearance = UILabel.appearance(whenContainedInInstancesOf: [FTSearchBar.self])
//        textBarAppearance.tintColor = .blue
        
        if let color = "#DF6E6E".hexColor() {
            FTThemesManager.setStatusBarBackgroundColor(color)
        }
        
        UIApplication.shared.statusBarStyle = .lightContent

    }
}
