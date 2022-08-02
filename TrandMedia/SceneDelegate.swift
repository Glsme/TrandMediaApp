//
//  SceneDelegate.swift
//  TrandMedia
//
//  Created by Seokjune Hong on 2022/07/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        UserDefaults.standard.set(false, forKey: "First")
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        if UserDefaults.standard.bool(forKey: "First") {
            print("UserDefault true")
            let sb = UIStoryboard(name: "Trend", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
            
            window?.rootViewController = UINavigationController(rootViewController: vc)
            
            window?.makeKeyAndVisible()
        } else {
            print("UserDefault false")
            let sb = UIStoryboard(name: "Trend", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "TrendTableViewController") as! TrendTableViewController
            
            window?.rootViewController = UINavigationController(rootViewController: vc)
            
            window?.makeKeyAndVisible()
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

