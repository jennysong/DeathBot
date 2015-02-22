//
//  GameScene.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var botDataManager = BotDataManager()
    var Jenny = Bot(gender: "Female", location: "BC")
    var character = BotNode()
    var happiness_button = SKSpriteNode(imageNamed: "happiness_button")
    var happiness_button_ = SKSpriteNode(imageNamed: "happiness_button_")
    var happiness_label = SKLabelNode(fontNamed:"Avenir-Black")
    var health_button = SKSpriteNode(imageNamed: "health_button")
    var health_button_ = SKSpriteNode(imageNamed: "health_button_")
    var health_label = SKLabelNode(fontNamed:"Avenir-Black")
    var age_button = SKSpriteNode(imageNamed: "age_button")
    var age_button_ = SKSpriteNode(imageNamed: "age_button_")
    var age_label = SKLabelNode(fontNamed:"Avenir-Black")
    var back_button = SKSpriteNode(imageNamed: "back_button.png")
    var action_button = SKSpriteNode(imageNamed: "action_button.png")
    var move_button = SKSpriteNode(imageNamed: "move_button.png")
    var back_button_ = SKSpriteNode(imageNamed: "back_button_.png")
    var action_button_ = SKSpriteNode(imageNamed: "action_button_.png")
    var move_button_ = SKSpriteNode(imageNamed: "move_button_.png")
    
    struct PhysicsCategory {
        static let None      : UInt32 = 0
        static let All       : UInt32 = UInt32.max
        static let Character : UInt32 = 0b1       // 1
        static let Food      : UInt32 = 0b10      // 2
    }
    override init(size: CGSize) {
        super.init(size: size)
        didMoveToView()
    }
    
    init(size: CGSize,bot: Bot) {
        super.init(size: size)
        Jenny = bot
        character = BotNode(bot: bot)
        didMoveToView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didMoveToView() {
        var GameSceneBG = SKSpriteNode(imageNamed: "background.png")
        GameSceneBG.size.height = self.size.height
        GameSceneBG.size.width = self.size.width
        GameSceneBG.anchorPoint = CGPoint(x:0, y:0)
        GameSceneBG.zPosition = 1
        addChild(GameSceneBG)
        
        //updateStatus()
        character.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        character.zPosition = 10
        var characScale = CGFloat(Double(Jenny.age) * 0.005 + 0.3)
        character.setScale(characScale)
        character.physicsBody = SKPhysicsBody(rectangleOfSize: character.size)
        character.physicsBody?.dynamic = true
        character.physicsBody?.categoryBitMask = PhysicsCategory.Character
        character.physicsBody?.contactTestBitMask = PhysicsCategory.Food
        character.physicsBody?.collisionBitMask = PhysicsCategory.None
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.usesPreciseCollisionDetection = true
        addChild(character)
        physicsWorld.contactDelegate = self
        
        
        happiness_label.text = "\(Jenny.happiness)"
        happiness_label.fontSize = 20
        happiness_label.fontColor = SKColor.whiteColor()
        happiness_label.position = CGPoint(x:0.935 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        happiness_label.zPosition = 5
        addChild(happiness_label)
        happiness_button.zPosition = 4
        happiness_button.xScale = 0.5
        happiness_button.yScale = 0.5
        happiness_button.position = CGPoint(x:0.92 * Double(self.frame.width), y: 0.922 * Double(self.frame.height))
        happiness_button_.zPosition = 4
        happiness_button_.xScale = 0.5
        happiness_button_.yScale = 0.5
        happiness_button_.position = CGPoint(x:0.92 * Double(self.frame.width), y: 0.922 * Double(self.frame.height))
        let happyButton:ActionButton = ActionButton(defaultButtonImage: happiness_button, activeButtonImage: happiness_button_, buttonAction: get_happiness_info)
        addChild(happyButton)
        
        
        health_label.text = "\(Jenny.health)"
        health_label.fontSize = 20
        health_label.fontColor = SKColor.whiteColor()
        health_label.position = CGPoint(x:0.82 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        health_label.zPosition = 5
        addChild(health_label)
        health_button.zPosition = 4
        health_button.xScale = 0.5
        health_button.yScale = 0.5
        health_button.position = CGPoint(x:0.805 * Double(self.frame.width), y: 0.922 * Double(self.frame.height))
        health_button_.zPosition = 4
        health_button_.xScale = 0.5
        health_button_.yScale = 0.5
        health_button_.position = CGPoint(x:0.805 * Double(self.frame.width), y: 0.922 * Double(self.frame.height))
        let healthButton:ActionButton = ActionButton(defaultButtonImage: health_button, activeButtonImage: health_button_, buttonAction: get_health_info)
        addChild(healthButton)
        
        age_label.text = "\(Jenny.age)"
        age_label.fontSize = 20
        age_label.fontColor = SKColor.whiteColor()
        age_label.position = CGPoint(x:0.705 * Double(self.frame.width), y: 0.90 * Double(self.frame.height))
        age_label.zPosition = 5
        addChild(age_label)
        age_button.zPosition = 4
        age_button.xScale = 0.5
        age_button.yScale = 0.5
        age_button.position = CGPoint(x:0.69 * Double(self.frame.width), y: 0.922 * Double(self.frame.height))
        age_button_.zPosition = 4
        age_button_.xScale = 0.5
        age_button_.yScale = 0.5
        age_button_.position = CGPoint(x:0.69 * Double(self.frame.width), y: 0.922 * Double(self.frame.height))
        let ageButton:ActionButton = ActionButton(defaultButtonImage: age_button, activeButtonImage: age_button_, buttonAction: get_age_info)
        addChild(ageButton)
        
        back_button.zPosition = 10
        back_button.xScale = 0.5
        back_button.yScale = 0.5
        back_button.position = CGPoint(x:0.05 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        back_button_.zPosition = 10
        back_button_.xScale = 0.5
        back_button_.yScale = 0.5
        back_button_.position = CGPoint(x:0.05 * Double(self.frame.width), y: 0.9 * Double(self.frame.height))
        let goBack: ActionButton = ActionButton(defaultButtonImage: back_button, activeButtonImage: back_button_, buttonAction: goBackToStart)
        addChild(goBack)
        
        action_button.zPosition = 10
        action_button.xScale = 0.5
        action_button.yScale = 0.5
        action_button.position = CGPoint(x:0.81 * Double(self.frame.width), y: 0.12 * Double(self.frame.height))
        action_button_.zPosition = 10
        action_button_.xScale = 0.5
        action_button_.yScale = 0.5
        action_button_.position = CGPoint(x:0.81 * Double(self.frame.width), y: 0.12 * Double(self.frame.height))
        let actionList:ActionButton = ActionButton(defaultButtonImage: action_button, activeButtonImage: action_button_, buttonAction: getActionList)
        addChild(actionList)
        
        move_button.zPosition = 10
        move_button.xScale = 0.5
        move_button.yScale = 0.5
        move_button.position = CGPoint(x:0.92 * Double(self.frame.width), y: 0.12 * Double(self.frame.height))
        move_button_.zPosition = 10
        move_button_.xScale = 0.5
        move_button_.yScale = 0.5
        move_button_.position = CGPoint(x:0.92 * Double(self.frame.width), y: 0.12 * Double(self.frame.height))
        let moveList:ActionButton = ActionButton(defaultButtonImage: move_button, activeButtonImage: move_button_, buttonAction: getMoveList)
        addChild(moveList)
        
        
        
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([SKAction.runBlock(addFood), SKAction.waitForDuration(randomTime())])
            ))
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            var time = sqrt(pow(Double(location.x - character.position.x),2.0) + pow(Double(location.y - character.position.y),2.0))/300
            let actionMove = SKAction.moveTo(location, duration: NSTimeInterval(CGFloat(time)))
            character.runAction(actionMove)
        }
    }
    
    
    func gotfood(character:SKNode, food:FoodNode) {
        var (deathRate,action) = self.Jenny.take(food.pickedFood)
        if dieOrNot(deathRate) {
            gameOver()
        }
        updateStatus()
        runAction(SKAction.playSoundFileNamed("bite.mp3", waitForCompletion: false))
        food.removeFromParent()
        

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
                gotfood(firstBody.node! as SKNode, food: secondBody.node as FoodNode)
        }
        
    }
   /*
    override func update(currentTime: CFTimeInterval) {
    }*/
    
    func addFood() {
        var food = FoodNode()
        var a = Double(pow(food.width/2,2.0) + pow(food.height/2,2.0))
        var b = Double(pow(character.size.width/2.0,2.0) + pow(character.size.height/2,2.0))
        var distLimit = a+b
        var positionX: Double = 0.0
        var positionY: Double = 0.0
        var distance: Double = 0.0
        do {
            var randomX = Double(arc4random()%100) / 100
            var randomY = Double(arc4random()%100) / 100
            positionX = (Double(self.frame.width) - Double(food.width)) * randomX + Double(food.width/2)
            positionY = (Double(self.frame.height) - Double(food.height)) * randomY + Double(food.height/2)
            distance = pow(positionX - Double(character.position.x),2.0) + pow(positionY - Double(character.position.y),2.0)
        } while distance + 1 < distLimit
        
        food.position = CGPoint(x:positionX, y:positionY)
        food.zPosition = 2
        
        food.physicsBody = SKPhysicsBody(circleOfRadius: food.width/2)
        food.physicsBody?.dynamic = true
        food.physicsBody?.categoryBitMask = PhysicsCategory.Food
        food.physicsBody?.contactTestBitMask = PhysicsCategory.Character
        food.physicsBody?.collisionBitMask = PhysicsCategory.None
        food.physicsBody?.affectedByGravity = false

        addChild(food)
        dispatch_after(food.delayTime, dispatch_get_main_queue()) {
            food.removeFromParent()
        }
    }
    
    

    func randomTime() -> NSTimeInterval {  //1 to 3 sec
        return NSTimeInterval(arc4random()%3+1)
    }
    
    var notYet3 = true
    var notYet13 = true
    var notYet20 = true
    var notYet55 = true
    var notYet80 = true
    func updateStatus(){
        checkLife()
        if(Jenny.age == 3 && notYet3) {
            updateCharacter()
            notYet3 = false
        } else if(Jenny.age == 13 && notYet13){
            updateCharacter()
            notYet13 = false
        } else if(Jenny.age == 20 && notYet20){
            updateCharacter()
            notYet20 = false
        } else if(Jenny.age == 55 && notYet55){
            updateCharacter()
            notYet55 = false
        } else if(Jenny.age == 80 && notYet80){
            updateCharacter()
            notYet80 = false
        }
        
        happiness_label.text = "\(Jenny.happiness)"
        health_label.text = "\(Jenny.health)"
        age_label.text = "\(Jenny.age)"
        var characScale = CGFloat(Double(Jenny.age) * 0.005 + 0.3)
        character.setScale(characScale)
        botDataManager.addNewBot(Jenny)
        botDataManager.save()
    }
    
    func updateCharacter(){
        var x = character.position.x
        var y = character.position.y
        self.character.removeFromParent()
        character = BotNode(bot: Jenny)
        character.position = CGPoint(x: x, y: y)
        character.zPosition = 10
        
        character.physicsBody = SKPhysicsBody(rectangleOfSize: character.size)
        character.physicsBody?.dynamic = true
        character.physicsBody?.categoryBitMask = PhysicsCategory.Character
        character.physicsBody?.contactTestBitMask = PhysicsCategory.Food
        character.physicsBody?.collisionBitMask = PhysicsCategory.None
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.usesPreciseCollisionDetection = true
        addChild(character)
    }

    
    func checkLife() {
        if (Jenny.health <= 0 || Jenny.happiness <= 0 || Jenny.age >= 100) {
            gameOver()
        }
        else if (Jenny.health >= 100) {
            println("Grow")
            Jenny.grow_age()
            Jenny.health = 50
            Jenny.happiness = 50
        }
        
    }
    
    func get_happiness_info() {
        //TODO
    }
    
    func get_health_info() {
        //TODO
    }
    
    func get_age_info() {
        //TODO
    }
    
    func dieOrNot(rate: Double) -> Bool {
        var randomRate = Double(arc4random()%101) / 100
        println("rate = \(rate), random = \(randomRate)")
        if rate > randomRate {
            return true
        }
        return false
    }
    
    func gameOver() {
        Jenny.dead = true
        botDataManager.addNewBot(Jenny)
        botDataManager.save()
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameOverScene(size: self.size,bot:self.Jenny)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
    func goBackToStart() {
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = Game(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
    func getActionList() {
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.crossFadeWithDuration(0.5)
            let scene = ActionScene(size: self.size, bot: self.Jenny)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }

    
    func getMoveList() {
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = MoveScene(size: self.size, bot: self.Jenny)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
}
