//
//  Alert.swift
//  GoogleBooks(MVVM)
//
//  Created by Yusuf DEMİRKOPARAN on 19.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
class AlertService {
   static func alert(error: String ) {
        let ac = UIAlertController.init(title: "Data Response Error",
                                        message: error,
                                        preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK!", style: .cancel, handler: nil)
        ac.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(ac, animated: true, completion: nil)
    }
}
