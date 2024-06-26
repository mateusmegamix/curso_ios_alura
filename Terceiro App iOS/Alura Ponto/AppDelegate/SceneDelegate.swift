//
//  SceneDelegate.swift
//  Alura Ponto
//
//  Created by Ândriu Felipe Coelho on 22/09/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    
    enum TipoDeShortcut: String {
        case registrarPonto = "RegistrarPonto"
    }

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        let homeTabItem = UITabBarItem()
        homeTabItem.title = "Inicio"
        homeTabItem.image = UIImage(named: "icon-home")

        let homeController = HomeViewController()
        homeController.tabBarItem = homeTabItem
        
        let reciboTabItem = UITabBarItem()
        reciboTabItem.title = "Recibos"
        reciboTabItem.image = UIImage(named: "icon-recept")
        
        let reciboController = ReciboViewController()
        reciboController.tabBarItem = reciboTabItem
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [homeController, reciboController]
        tabBarController.selectedViewController = homeController
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.navigationBar.isHidden = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if let tipo = TipoDeShortcut(rawValue: shortcutItem.type) {
            switch tipo {
            case .registrarPonto:
                let navigationController = window?.rootViewController as? UINavigationController
                
                if let tabBarController = navigationController?.viewControllers.first as? UITabBarController {
                    navigationController?.popToRootViewController(animated: true)
                    
                    if let home = tabBarController.viewControllers?.first as? HomeViewController {
                        home.tentaAbrirCamera()
                    }
                }
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

