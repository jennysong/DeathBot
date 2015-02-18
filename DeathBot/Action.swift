//
//  Action.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class Action {
    var start_month: Int
    var end_month: Int
    var gender: String
    var province: String
    var special: Bool
    var title: String
    
    init(start_month: Int, end_month: Int, gender: String, province: String, special: Bool, title: String) {
        self.start_month = start_month
        self.end_month = end_month
        self.gender = gender
        self.province = province
        self.special = special
        self.title = title
    }
    
    func execute() {
        switch self.title {
            case "eat":
                println("Bot is eatting")
            default:
                println("Bot is doing nothing")
            
        }
    }
    
    
    
    
}