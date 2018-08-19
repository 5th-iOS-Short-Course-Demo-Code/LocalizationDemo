//
//  LanguageManager.swift
//  LocalizationDemo
//
//  Created by Chhaileng Peng on 8/19/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import Foundation

class LanguageManager {
    
    // Shared Instance or Shred object
    static let shared = LanguageManager()
    
    private init() { }
    
    var language: String {
        set {
            UserDefaults.standard.set(newValue.lowercased(), forKey: "LanguageCode")
            UserDefaults.standard.synchronize()
        }
        get {
            if let lang = UserDefaults.standard.string(forKey: "LanguageCode") {
                return lang.lowercased()
            } else {
                return self.language
            }
        }
    }
    
}

extension String {
    var localized: String {
        get {
            let languageCode = LanguageManager.shared.language
            let bundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj")
            let languageBundle = Bundle(path: bundlePath!)
            let translatedString = languageBundle?.localizedString(forKey: self, value: nil, table: nil)
            
            return translatedString!
        }
    }
}
















