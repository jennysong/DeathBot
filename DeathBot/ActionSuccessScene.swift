//
//  ActionSuccessScene.swift
//  DeathBot
//
//  Created by Jenny Song on 2015-02-22.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation
import SpriteKit

class ActionSuccessScene: SKScene {
    var bot: Bot
    init(size: CGSize,bot: Bot) {
        self.bot = bot
        super.init(size: size)
        let ratio = 1/self.size.height*195
        var reward = "low"
        
        var rewardBG = SKSpriteNode(imageNamed: "reward_bg.png")
        rewardBG.size.height = self.size.height
        rewardBG.size.width = self.size.width
        rewardBG.anchorPoint = CGPoint(x:0, y:0)
        rewardBG.zPosition = 1
        
        
        var rewardImg = SKSpriteNode(imageNamed: "reward_\(reward).png")
        rewardImg.setScale(0.5)
        rewardImg.position = CGPoint(x:self.size.width*(0.50), y:self.size.width*(0.353))
        rewardImg.zPosition = 10
        
        var reward_title = SKSpriteNode(imageNamed: "reward_title.png")
        reward_title.setScale(0.5)
        reward_title.position = CGPoint(x:self.size.width*(0.50), y:self.size.width*(0.433))
        reward_title.zPosition = 5
        
        var reward_receive_button = SKSpriteNode(imageNamed: "reward_receive_button.png")
        reward_receive_button.setScale(0.5)
        reward_receive_button.position = CGPoint(x:self.size.width*(0.5), y:self.size.height*0.15)
        reward_receive_button.zPosition = 10
        var reward_receive_button_ = SKSpriteNode(imageNamed: "reward_receive_button_.png")
        reward_receive_button_.size.height *= ratio
        reward_receive_button_.size.width *= ratio
        reward_receive_button_.position = CGPoint(x:self.size.width*(0.5), y:self.size.height*0.15)
        reward_receive_button_.zPosition = 10
        let goBack:ActionButton = ActionButton(defaultButtonImage: reward_receive_button, activeButtonImage: reward_receive_button_, buttonAction: goBackToGame)
        
        addChild(rewardBG)
        addChild(rewardImg)
        addChild(reward_title)
        addChild(goBack)
        rewardBG.alpha = 0
        rewardImg.alpha = 0
        reward_title.alpha = 0
        goBack.alpha = 0
        
        let fadeInImages = SKAction.fadeInWithDuration(1)
        
        runAction(SKAction.sequence([SKAction.runBlock{
            rewardBG.runAction(fadeInImages)
            rewardImg.runAction(fadeInImages)}, SKAction.waitForDuration(1.2), SKAction.runBlock{
                reward_title.runAction(fadeInImages)}, SKAction.waitForDuration(1.5), SKAction.runBlock{
                goBack.runAction(fadeInImages)
            }]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func goBackToGame(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.crossFadeWithDuration(0.5)
            let scene = GameScene(size: self.size, bot: self.bot)
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
