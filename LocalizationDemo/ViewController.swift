//
//  ViewController.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 8/19/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeLanguageLButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        if LanguageManager.shared.language == "km" {
            LanguageManager.shared.language = "en"
        } else if LanguageManager.shared.language == "en" {
            LanguageManager.shared.language = "km"
        }
        
        // Refresh storyboard
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let homeController = storyboard.instantiateInitialViewController()
//        appDelegate.window?.rootViewController = homeController
        
        
        // Using observer
        NotificationCenter.default.post(name: Notification.Name("languageChanged"), object: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start translate label
        translateScreen()
        
        NotificationCenter.default.addObserver(self, selector: #selector(translateScreen), name: Notification.Name("languageChanged"), object: nil)
        
    }
    
    @objc func translateScreen() {
        self.title = "setting".localized
        welcomeLabel.text = "welcome".localized
        changeLanguageLButton.setTitle("Change Language".localized, for: .normal)
    }
    
}

