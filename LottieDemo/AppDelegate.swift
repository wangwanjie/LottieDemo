//
//  AppDelegate.swift
//  LottieDemo
//
//  Created by VanJay on 2021/8/1.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = ViewController()
        let naVC = UINavigationController(rootViewController: vc)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = naVC
        window.backgroundColor = .black
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}
