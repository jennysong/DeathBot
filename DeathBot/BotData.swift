//
//  BotData.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation


class BotData: NSObject, NSCoding {
    let bot:Bot
    let dateOfScore: NSDate
    
    init(bot:Bot, dateOfScore:NSDate) {
        self.bot = bot
        self.dateOfScore = dateOfScore
    }
    
    required init(coder: NSCoder) {
        self.bot = coder.decodeObjectForKey("bot")! as Bot
        self.dateOfScore = coder.decodeObjectForKey("dateOfScore")! as NSDate
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.bot, forKey: "bot")
        coder.encodeObject(self.dateOfScore, forKey: "dateOfScore")
    }
}
