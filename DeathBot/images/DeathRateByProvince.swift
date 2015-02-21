//
//  DeathRateByProvince.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class DeathRateByProvince {
    var province: String
    init(province: String){
        self.province = province
    }
    func rate() -> Double {
        switch self.province {
            case "ON":
                return 0.377316
            case "QC":
                return 0.236833
            case "NS":
                return 0.034882
            case "NB":
                return 0.026624
            case "MB":
                return 0.041111
            case "BC":
                return 0.128416
            case "PE":
                return 0.005087
            case "SK":
                return 0.037773
            case "AB":
                return 0.090698
            case "NL":
                return 0.018912
            case "NT":
                return 0.000767
            case "YT":
                return 0.000869
            case "NU":
                return 0.000713
            default:
                return 0
        }
    }
}