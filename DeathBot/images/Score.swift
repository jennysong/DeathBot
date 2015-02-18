//
//  HighScore.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/25/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation

class Score: NSObject, NSCoding {
    let score:Int
    let dateOfScore: NSDate
    
    init(score:Int, dateOfScore:NSDate) {
        self.score = score
        self.dateOfScore = dateOfScore
    }
    
    required init(coder: NSCoder) {
        self.score = coder.decodeObjectForKey("score")! as Int
        self.dateOfScore = coder.decodeObjectForKey("dateOfScore")! as NSDate
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.score, forKey: "score")
        coder.encodeObject(self.dateOfScore, forKey: "dateOfScore")
    }
}
