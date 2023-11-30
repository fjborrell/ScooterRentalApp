//
//  ScooterApp.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/18/23.
//

import SwiftUI

@main
struct ScooterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate
    var windowSharedModel = WindowSharedModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(windowSharedModel)
        }
    }
}

/// App Delegate
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}

/// Scene Delegate
@Observable
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    weak var windowScene: UIWindowScene?
    var tabWindow: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        windowScene = scene as? UIWindowScene
    }
    
    func addTabBar(windowSharedModel: WindowSharedModel) {
        guard let scene = windowScene else {
            return
        }
        
        let tabBarController = UIHostingController(rootView: 
            CustomTabBar()
                .environment(windowSharedModel)
                .frame(maxHeight: .infinity, alignment: .bottom)
        )
        tabBarController.view.backgroundColor = .clear
        /// Window
        let tabWindow = PassThroughWindow(windowScene: scene)
        tabWindow.rootViewController = tabBarController
        tabWindow.isHidden = false
        tabWindow.windowLevel = .alert
        
        
        /// Strong Tab Window Reference
        self.tabWindow = tabWindow
    }
}

/// PassThrough UIWindow (enable interaction behind tab bar)
class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else { return nil }
        return rootViewController?.view == view ? nil : view
    }
}


