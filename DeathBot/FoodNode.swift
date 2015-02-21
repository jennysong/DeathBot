//
//  FoodNode.swift
//  DeathBot
//
//  Created by Jenny Song on 2015-02-21.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import SpriteKit

class FoodNode: SKNode, SKPhysicsContactDelegate {
    
    let foodarray = ["burger","cherry","banana","fish","apple","milk","chicken","pepper","grape","egg","carrot","softdrink","lobster","cheese","bread","cigarette","alcohol","donut","pizza","drug"]
    var pickedFood: String = ""
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    
    struct PhysicsCategory {
        static let None      : UInt32 = 0
        static let All       : UInt32 = UInt32.max
        static let Character : UInt32 = 0b1       // 1
        static let Food      : UInt32 = 0b10      // 2
    }
    
    override init() {
        super.init()
        var randnum0to19 = Int(arc4random()%20)
        pickedFood = foodarray[randnum0to19]
        let food = SKSpriteNode(imageNamed:"pizza.png")
        
        food.xScale = 0.3
        food.yScale = 0.3
        
        width = food.size.width
        height = food.size.height
       
        addChild(food)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}