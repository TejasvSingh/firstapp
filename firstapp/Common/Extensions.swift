//
//  Extensions.swift
//  firstapp
//
//  Created by Shobhakar Tiwari on 1/26/26.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func validate(userName: String?, password: String?) -> Bool {
        guard let username = userName, let password = password else {
            return false
        }
        
        return username.count > 0 && username.count < 10 && password.count > 0 && password.count < 8
    }
}


extension String {
    func countNoOfCharacters() -> Int {
        self.count
    }
}

