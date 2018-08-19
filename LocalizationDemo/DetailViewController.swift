//
//  DetailViewController.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 8/19/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        translateScreen()
        
        NotificationCenter.default.addObserver(self, selector: #selector(translateScreen), name: Notification.Name("languageChanged"), object: nil)
    }
    
    @objc func translateScreen() {
        detailLabel.text = "detail".localized
        self.tabBarController?.tabBar.items![0].title = "detail".localized
        self.tabBarController?.tabBar.items![1].title = "setting".localized
    }

}
