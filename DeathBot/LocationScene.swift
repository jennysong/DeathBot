//
//  LocationSence.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation
import SpriteKit

class LocationScene: SKScene {
    var botDataManager = BotDataManager()
    var gender: String?
    init(size: CGSize, gender: String) {
        super.init(size: size)
        self.gender = gender
        let ratio = 1/self.size.height*195
        
        /*
        var locationBG = SKSpriteNode(imageNamed: "locationBG")
        locationBG.size.height = self.size.height
        locationBG.size.width = self.size.width
        locationBG.anchorPoint = CGPoint(x:0, y:0)
        locationBG.zPosition = 1
        addChild(locationBG)
        */
        
        var backButton = SKSpriteNode(imageNamed: "back_button")
        backButton.size.height *= ratio
        backButton.size.width *= ratio
        backButton.position = CGPoint(x:self.size.width*(0.90), y:self.size.height*0.95)
        backButton.zPosition = 10
        var backButton_ = SKSpriteNode(imageNamed: "back_button_")
        backButton_.size.height *= ratio
        backButton_.size.width *= ratio
        backButton_.position = CGPoint(x:self.size.width*(0.90), y:self.size.height*0.95)
        backButton_.zPosition = 10
        let goBack:ActionButton = ActionButton(defaultButtonImage: backButton, activeButtonImage: backButton_, buttonAction: goBackToStart)
        addChild(goBack)
        
        addLocation("ON", x: self.size.width*(0.14), y: self.size.height*0.2)
        addLocation("QC", x: self.size.width*(0.32), y: self.size.height*0.2)
        addLocation("NS", x: self.size.width*(0.50), y: self.size.height*0.2)
        addLocation("NB", x: self.size.width*(0.68), y: self.size.height*0.2)
        addLocation("MB", x: self.size.width*(0.86), y: self.size.height*0.2)
        addLocation("BC", x: self.size.width*(0.2), y: self.size.height*0.5)
        addLocation("PE", x: self.size.width*(0.4), y: self.size.height*0.5)
        addLocation("SK", x: self.size.width*(0.6), y: self.size.height*0.5)
        addLocation("AB", x: self.size.width*(0.8), y: self.size.height*0.5)
        addLocation("NL", x: self.size.width*(0.2), y: self.size.height*0.8)
        addLocation("NT", x: self.size.width*(0.4), y: self.size.height*0.8)
        addLocation("YT", x: self.size.width*(0.6), y: self.size.height*0.8)
        addLocation("NU", x: self.size.width*(0.8), y: self.size.height*0.8)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func goBackToStart(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = Game(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
    func addLocation(location: String,x: CGFloat, y: CGFloat){
        let ratio = 1/self.size.height*195
        var lo = SKSpriteNode(imageNamed: location)
 //       lo.setScale(0.30)
        lo.name = location
        lo.position = CGPoint(x: x, y: y)
        lo.zPosition = 10
        addChild(lo)
        var lo_label = SKLabelNode(fontNamed:"AvenirNext")
        
        lo_label.text = location
        lo_label.fontSize = 20
        lo_label.position = CGPoint(x: x, y: y - lo.size.height/1.35)
        lo_label.zPosition = 10
        addChild(lo_label)

        
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchNode = nodeAtPoint(location)
            if(touchNode.name != nil){
                GoToGameScene(touchNode.name!)
            }
        }
        
    }
    
    func GoToGameScene(location: String){
        var bot = Bot(gender: self.gender!, location: location)
        println("NewBot is created! Gender : \(self.gender!), Location: \(location)")
        botDataManager.addNewBot(bot)
        botDataManager.save()
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size, bot: bot)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }

    
}