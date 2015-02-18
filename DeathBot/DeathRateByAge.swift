//
//  DeathRateByAge.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation

class DeathRateByAge {
    private var age: Int
    init(age: Int){
        self.age = age
    }
    func rate() -> Double {
        switch self.age {
        case 0...4:
            return 0.008526
        case 5...9:
            return 0.000657
        case 10...14:
            return 0.000942
        case 15...19:
            return 0.003280
        case 20...24:
            return 0.005139
        case 25...29:
            return 0.005093
        case 30...34:
            return 0.005899
        case 35...39:
            return 0.007320
        case 40...44:
            return 0.011947
        case 45...49:
            return 0.021498
        case 50...54:
            return 0.034163
        case 55...59:
            return 0.046998
        case 60...64:
            return 0.062944
        case 65...69:
            return 0.074890
        case 70...74:
            return 0.090340
        case 75...79:
            return 0.119187
        case 80...84:
            return 0.156188
        case 85...89:
            return 0.168969
        case 90...94:
            return 0.116939
        case 95...99:
            return 0.048853
        case 100...150:
            return 0.010228
        default:
            return 0
        }
    }
}