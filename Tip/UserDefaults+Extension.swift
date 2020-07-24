//
//  UserDefaults+Extension.swift
//  Tip
//
//  Created by Archit Jain on 7/22/20.
//  Copyright © 2020 archit. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    func setValueOfTip(index:Int, value: Int){
        switch index {
        case 0:
            UserDefaults.standard.set(value, forKey: "Tip1")
        case 1:
            UserDefaults.standard.set(value, forKey: "Tip2")
        case 2:
            UserDefaults.standard.set(value, forKey: "Tip3")
        default:
            print("Bad Index")
        }
        
    }
    
    func getValueOfTip(index:Int) -> Int{
        var value = 0
        switch index {
        case 0:
            value = UserDefaults.standard.value(forKey: "Tip1") as! Int
        case 1:
            value = UserDefaults.standard.value(forKey: "Tip2") as! Int
        case 2:
            value = UserDefaults.standard.value(forKey: "Tip3") as! Int
        default:
            print("Bad Index")
        }
        return value
    }
    
    func setup(){
        UserDefaults.standard.set(true, forKey: "Setup")
    }
    
    func isSetup() -> Bool?{
        return UserDefaults.standard.value(forKey: "Setup") as? Bool
    }
}
