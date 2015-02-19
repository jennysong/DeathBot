//
//  BotView.swift
//  DeathBot
//
//  Created by Shawn Jung on 2015-02-21.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import SpriteKit

class BotNode: SKNode {
    var bodyNode: SKSpriteNode
//    var leftFoot: SKSpriteNode
//    var rightFoot: SKSpriteNode
    var size: CGSize
    
    override init() {
        
        bodyNode = SKSpriteNode(imageNamed:"male-toddler.png")
        
        size = bodyNode.size
        super.init()
        
        addChild(bodyNode)
    }
    
    init(bot: Bot){
        bodyNode = SKSpriteNode(imageNamed:"\(bot.gender)-\(bot.status).png")
        size = bodyNode.size
        super.init()
        
        addChild(bodyNode)
    }
    
    override func setScale(scale: CGFloat) {
        super.setScale(scale)
        size.height = bodyNode.size.height * yScale
        size.width = bodyNode.size.width * xScale

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}