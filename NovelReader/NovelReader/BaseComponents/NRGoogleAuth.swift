//
//  NRGoogleAuth.swift
//  NovelReader
//
//  Created by Praveen Prabhakar on 30/04/18.
//  Copyright © 2018 Praveen Prabhakar. All rights reserved.
//

import Foundation
import GoogleSignIn

//extension NRAppDelegate {
//    func setupGoogleAuth() { }
//}

class NRGoogleAuth: NSObject, GIDSignInDelegate, GIDSignInUIDelegate {

    static let sharedInstance = NRGoogleAuth()

    class func setupGoogleAuth() {
        // Initialize sign-in
//        GIDSignIn.sharedInstance().clientID = "769359482558-l9uifqdbpq49n1pjqk6vvb2qtekm0ktl.apps.googleusercontent.com"
//        GIDSignIn.sharedInstance().delegate = NRGoogleAuth.sharedInstance
//        GIDSignIn.sharedInstance().uiDelegate = NRGoogleAuth.sharedInstance

        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
    }

    class func signInButton() -> GIDSignInButton {
        let signButtton = GIDSignInButton()
        signButtton.style = .iconOnly
        signButtton.colorScheme = .dark

        return signButtton
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {

        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        }
    }

    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
//        myActivityIndicator.stopAnimating()
    }

    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        NRAppDelegate.getRootController().present(viewController, animated: true, completion: nil)
    }

    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        NRAppDelegate.getRootController().dismiss(animated: true, completion: nil)
    }
}

extension NRAppDelegate {

    class func getRootController() -> UIViewController {
        let appDelegate = UIApplication.shared.delegate as! NRAppDelegate
        return appDelegate.window!.rootViewController!
    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url,
                    sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                    annotation: options[UIApplicationOpenURLOptionsKey.annotation])
    }
}
