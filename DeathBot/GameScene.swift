//
//  GameScene.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let character = SKSpriteNode(imageNamed:"Character.png")
    var Jenny = Bot(gender: "female", location: "BC")
    
    override func didMoveToView(view: SKView) {

        character.xScale = 0.3
        character.yScale = 0.3
        character.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        character.zPosition = 10
        addChild(character)
        
        var happiness_label = SKLabelNode(fontNamed:"Chalkduster")
        happiness_label.text = "Happiness: \(Jenny.happiness)"
        happiness_label.fontSize = 20
        happiness_label.position = CGPoint(x:0.7 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        happiness_label.zPosition = 5
        addChild(happiness_label)
        
        
        var health_label = SKLabelNode(fontNamed:"Chalkduster")
        health_label.text = "Health: \(Jenny.health)"
        health_label.fontSize = 20
        health_label.position = CGPoint(x:0.2 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        health_label.zPosition = 5
        addChild(health_label)
        
        addFood()
        addFood()
        addFood()

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let actionMove = SKAction.moveTo(location, duration: NSTimeInterval(CGFloat(1.0)))
            character.runAction(actionMove)
            

        }
    }
   
    override func update(currentTime: CFTimeInterval) {
    }
    
    func addFood(){
        let food = SKSpriteNode(imageNamed:"pizza.png")
        food.xScale = 0.3
        food.yScale = 0.3
        var randomX = Double(arc4random()%100) / 100
        var randomY = Double(arc4random()%100) / 100
        food.position = CGPoint(x:Double(self.frame.width) * randomX, y:Double(self.frame.height) * randomY)
        food.zPosition = 1
        addChild(food)
        
    }
    
    /*
    struct PhysicsCategory {
        static let None      : UInt32 = 0
        static let All       : UInt32 = UInt32.max
        static let character : UInt32 = 0b1       // 1
        static let food      : UInt32 = 0b10      // 2
    }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
    
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if ((firstBody.categoryBitMask & PhysicsCategory.character != 0) &&
        (secondBody.categoryBitMask & PhysicsCategory.food != 0)) {
            //gotFood(food)
            println("collide")
        }
    }*/
    
    
    func gotFood(food: SKSpriteNode) {
        food.removeFromParent()
        Jenny.health -= 5
        Jenny.happiness += 5
    }
}
