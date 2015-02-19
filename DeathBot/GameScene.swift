//
//  GameScene.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let character = BotNode()
    var Jenny = Bot(gender: "Female", location: "BC")
    var happiness_label = SKLabelNode(fontNamed:"Chalkduster")
    var health_label = SKLabelNode(fontNamed:"Chalkduster")
    struct PhysicsCategory {
        static let None      : UInt32 = 0
        static let All       : UInt32 = UInt32.max
        static let Character : UInt32 = 0b1       // 1
        static let Food      : UInt32 = 0b10      // 2
    }
    
    override func didMoveToView(view: SKView) {
        var GameSceneBG = SKSpriteNode(imageNamed: "GameSceneBG")
        GameSceneBG.size.height = self.size.height
        GameSceneBG.size.width = self.size.width
        GameSceneBG.anchorPoint = CGPoint(x:0, y:0)
        GameSceneBG.zPosition = 1
        //addChild(GameSceneBG)
        
        character.setScale(0.3)
        character.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        character.zPosition = 10
        
        character.physicsBody = SKPhysicsBody(rectangleOfSize: character.size)
        character.physicsBody?.dynamic = true
        character.physicsBody?.categoryBitMask = PhysicsCategory.Character
        character.physicsBody?.contactTestBitMask = PhysicsCategory.Food
        character.physicsBody?.collisionBitMask = PhysicsCategory.None
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.usesPreciseCollisionDetection = true
        addChild(character)
        physicsWorld.contactDelegate = self
        
        
        happiness_label.text = "Happiness: \(Jenny.happiness)"
        happiness_label.fontSize = 20
        happiness_label.position = CGPoint(x:0.7 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        happiness_label.zPosition = 5
        addChild(happiness_label)
        
        
        health_label.text = "Health: \(Jenny.health)"
        health_label.fontSize = 20
        health_label.position = CGPoint(x:0.2 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        health_label.zPosition = 5
        addChild(health_label)
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([SKAction.runBlock(addFood), SKAction.waitForDuration(Int(arc4random()%5))])
            ))
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let actionMove = SKAction.moveTo(location, duration: NSTimeInterval(CGFloat(1.0)))
            character.runAction(actionMove)
        }
    }
    
    
    func gotfood(character:SKNode, food:SKSpriteNode) {
        food.removeFromParent()
        Jenny.health -= 5
        Jenny.happiness += 5
        if Jenny.happiness>=100 {
            Jenny.happiness = 100
        }
        happiness_label.text = "Happiness: \(Jenny.happiness)"
        health_label.text = "Health: \(Jenny.health)"
        addFood()
        Jenny.doAction("eat")
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
        
        // 2
        if ((firstBody.categoryBitMask & PhysicsCategory.Character != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Food != 0)) {
                gotfood(firstBody.node! as SKNode, food: secondBody.node as SKSpriteNode)
        }
        
    }
   /*
    override func update(currentTime: CFTimeInterval) {
    }*/
    
    func addFood(){
        let food = SKSpriteNode(imageNamed:"pizza.png")
        food.xScale = 0.1
        food.yScale = 0.1
        var randomX = Double(arc4random()%100) / 100
        var randomY = Double(arc4random()%100) / 100
        food.position = CGPoint(x:(Double(self.frame.width) - Double(food.size.width)) * randomX + Double(food.size.width/2), y:(Double(self.frame.height) - Double(food.size.height)) * randomY + Double(food.size.height/2))
        food.zPosition = 1
        food.physicsBody = SKPhysicsBody(circleOfRadius: food.size.width/2)
        food.physicsBody?.dynamic = true
        food.physicsBody?.categoryBitMask = PhysicsCategory.Food
        food.physicsBody?.contactTestBitMask = PhysicsCategory.Character
        food.physicsBody?.collisionBitMask = PhysicsCategory.None
        food.physicsBody?.affectedByGravity = false
        addChild(food)
        
    }
    
    
}
