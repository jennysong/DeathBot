//
//  GameOverScene.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/19/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    var bot: Bot
    var title: String
    var dyingMessage: String = ""
    init(size: CGSize,bot: Bot, title: String = "Reason of Death", message: String) {
        self.title = title
        self.bot = bot
        super.init(size: size)
        dyingMessage = message
        
        let ratio = 1/self.size.height*195
        
        
        var gameOverBG = SKSpriteNode(imageNamed: "gameover_bg.png")
        gameOverBG.size.height = self.size.height
        gameOverBG.size.width = self.size.width
        gameOverBG.anchorPoint = CGPoint(x:0, y:0)
        gameOverBG.zPosition = 1
        
        
        var deadEgg = SKSpriteNode(imageNamed: "dead_egg.png")
        deadEgg.setScale(0.5)
        deadEgg.position = CGPoint(x:self.size.width*(0.50), y:self.size.width*(0.353))
        deadEgg.zPosition = 10
        
        var gameoverTitle = SKSpriteNode(imageNamed: "gameover_title.png")
        gameoverTitle.setScale(0.5)
        gameoverTitle.position = CGPoint(x:self.size.width*(0.50), y:self.size.width*(0.433))
        gameoverTitle.zPosition = 5
        
        var backButton = SKSpriteNode(imageNamed: "gameover_home_button.png")
        backButton.setScale(0.5)
        backButton.position = CGPoint(x:self.size.width*(0.5), y:self.size.height*0.15)
        backButton.zPosition = 10
        var backButton_ = SKSpriteNode(imageNamed: "gameover_home_button_.png")
        backButton_.size.height *= ratio
        backButton_.size.width *= ratio
        backButton_.position = CGPoint(x:self.size.width*(0.5), y:self.size.height*0.15)
        backButton_.zPosition = 10
        let goBack:ActionButton = ActionButton(defaultButtonImage: backButton, activeButtonImage: backButton_, buttonAction: goBackToStart)
        
        addChild(gameOverBG)
        addChild(deadEgg)
        addChild(gameoverTitle)
        addChild(goBack)
        gameOverBG.alpha = 0
        deadEgg.alpha = 0
        gameoverTitle.alpha = 0
        goBack.alpha = 0

        let fadeInImages = SKAction.fadeInWithDuration(1)
        
        runAction(SKAction.sequence([SKAction.runBlock{
            var currentLocation = self.getLocationName(bot.location)
            var DRBP = DeathRateByProvince(province: bot.location).rate() * 100
            UIAlertView(title: self.title, message: self.dyingMessage, delegate: nil, cancelButtonTitle: "OK").show()
            },SKAction.waitForDuration(1.5),SKAction.runBlock{
            gameOverBG.runAction(fadeInImages)
            deadEgg.runAction(fadeInImages)}, SKAction.waitForDuration(1.2), SKAction.runBlock{
                gameoverTitle.runAction(fadeInImages)
                goBack.runAction(fadeInImages)
            }]))
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
    func getLocationName(code: String) -> String{
        switch code {
        case "ON":
            return "Ontario"
        case "QC":
            return "Quebec"
        case "NS":
            return "Nova Scotia"
        case "NB":
            return "New Brunswick"
        case "MB":
            return "Manitoba"
        case "BC":
            return "British Columbia"
        case "PE":
            return "Prince Edward Island"
        case "SK":
            return "Saskatchewan"
        case "AB":
            return "Alberta"
        case "NL":
            return "Newfoundland and Labrador"
        case "NT":
            return "Northwest Territories"
        case "YT":
            return "Yukon"
        case "NU":
            return "Nunavut"
        default:
            return "Worng Location"
        }
    }
}
