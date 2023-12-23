//
//  SceneDelegate.swift
//  ChuckNorrisJokes
//
//  Created by Cecilia Andrea Pesce on 22/12/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {if let windowScene = scene as? UIWindowScene {
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UINavigationController(rootViewController: ViewController())
        self.window = window
        window.makeKeyAndVisible()
    }
    }
}
