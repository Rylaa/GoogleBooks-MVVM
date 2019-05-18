//
//  AppRouter.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
// işleyiş
/*
 arama yaptı enter'a bastı
 veri gidicek viewmodel'e viewmodelden presentation'a gidicem
 oradan alıp viewmodel'e daha sonra tekrar view'e ileticem
 */
final class AppRouter {
    var window : UIWindow?
    func start() {
        window = UIWindow()
        let controller = SearchBooksBuilder.make()
        let rootController = UINavigationController(rootViewController: controller)
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}
