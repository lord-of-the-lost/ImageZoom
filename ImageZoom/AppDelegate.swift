//
//  AppDelegate.swift
//  ImageZoom
//
//  Created by Николай Игнатов on 21.07.2023.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var  window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

