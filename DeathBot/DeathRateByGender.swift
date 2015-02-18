//
//  DeathRateByGender.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class DeathRateByGender {
    private var gender: String
    init(gender: String){
        self.gender = gender
    }
    func rate() -> Double {
        switch self.gender {
        case "Male":
            return 0.000713
        case "Female":
            return 0.499979
        default:
            return 0
        }
    }
}