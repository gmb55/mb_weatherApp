//
//  SceneDelegate.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit
import IQKeyboardManagerSwift

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var appCoordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        let navigationController = UINavigationController()

        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .gray
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        } else {
            // Fallback for older iOS versions
            navigationController.navigationBar.barTintColor = .gray
            navigationController.navigationBar.tintColor = .black
            navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        }
        
        IQKeyboardManager.shared.enable = true
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.start()
        window.rootViewController = navigationController

        self.window = window
        window.makeKeyAndVisible()
    }
}

