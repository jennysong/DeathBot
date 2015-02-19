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
    
    init(bot:Bot) {
        self.bot = bot
    }
    
    required init(coder: NSCoder) {
        self.bot = coder.decodeObjectForKey("bot")! as Bot
        
        super.init()
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(self.bot, forKey: "bot")
    }
}
