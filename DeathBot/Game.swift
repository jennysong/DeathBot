//
//  GameStart.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//


import Foundation
import SpriteKit
import UIKit
import AVFoundation


class Game: SKScene {
    var botDataManager = BotDataManager()
    var bot:Bot
    
    override init(size: CGSize) {
        bot = botDataManager.get()
        super.init(size: size)
        println("Hi =\(bot.age) \(bot.gender),\(bot.location)")
        let ratio = 1/self.size.height*195
        
        var background = SKSpriteNode(imageNamed: "landingBG")
        background.yScale = 0.5
        background.xScale = 0.5
        background.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.42 * Double(self.frame.height))
        background.zPosition = 1

        var buttonNewGame = SKSpriteNode(imageNamed: "start_button")
        buttonNewGame.yScale = 0.5
        buttonNewGame.xScale = 0.5
        buttonNewGame.position = CGPoint(x:0.37 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonNewGame.zPosition = 10
        var buttonNewGame_ = SKSpriteNode(imageNamed: "start_button_")
        buttonNewGame.yScale = 0.5
        buttonNewGame.xScale = 0.5
        buttonNewGame_.position = CGPoint(x:0.37 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonNewGame_.zPosition = 10
        
        var buttonContinue = SKSpriteNode(imageNamed: "continue_button")
        buttonContinue.yScale = 0.5
        buttonContinue.xScale = 0.5
        buttonContinue.position = CGPoint(x:0.63 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonContinue.zPosition = 10
        var buttonContinue_ = SKSpriteNode(imageNamed: "continue_button_")
        buttonContinue_.yScale = 0.5
        buttonContinue_.xScale = 0.5
        buttonContinue_.position = CGPoint(x:0.63 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonContinue_.zPosition = 10
        
        var buttonHowTo = SKSpriteNode(imageNamed: "info_button")
        buttonHowTo.yScale = 0.5
        buttonHowTo.xScale = 0.5
        buttonHowTo.position = CGPoint(x:0.8 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonHowTo.zPosition = 10
        var buttonHowTo_ = SKSpriteNode(imageNamed: "info_button_")
        buttonHowTo_.yScale = 0.5
        buttonHowTo_.xScale = 0.5
        buttonHowTo_.position = CGPoint(x:0.8 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonHowTo_.zPosition = 10
        
        var copyrightLabel = SKSpriteNode(imageNamed: "copyright_label")
        copyrightLabel.yScale = 0.5
        copyrightLabel.xScale = 0.5
        copyrightLabel.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.03 * Double(self.frame.height))
        copyrightLabel.zPosition = 10
        
        let newGame:ActionButton = ActionButton(defaultButtonImage: buttonNewGame, activeButtonImage: buttonNewGame_, buttonAction: changeSceneToNewGame)
        
        let continueGame:ActionButton = ActionButton(defaultButtonImage: buttonContinue, activeButtonImage: buttonContinue_, buttonAction: changeSceneToContinueGame)
        
        let howTo:ActionButton = ActionButton(defaultButtonImage: buttonHowTo, activeButtonImage: buttonHowTo_, buttonAction: changeSceneToHowTo)
        addChild(background)
        addChild(newGame)
        addChild(continueGame)
        addChild(howTo)
        addChild(copyrightLabel)
        newGame.alpha = 0
        continueGame.alpha = 0
        howTo.alpha = 0
        copyrightLabel.alpha = 0
        
        let moveBackground = SKAction.moveTo(CGPoint(x:0.5 * Double(self.frame.width), y: 0.57 * Double(self.frame.height)), duration: NSTimeInterval(1))
        let fadeInImages = SKAction.fadeInWithDuration(1.5)
  
        
        runAction(SKAction.sequence([SKAction.waitForDuration(1), SKAction.runBlock{
            background.runAction(moveBackground)},SKAction.waitForDuration(0.5),SKAction.runBlock{newGame.runAction(fadeInImages)
                continueGame.runAction(fadeInImages)
                howTo.runAction(fadeInImages)
                copyrightLabel.runAction(fadeInImages)} ]))
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeSceneToNewGame(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.crossFadeWithDuration(0.5)
            let scene = NewGameScene(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    func changeSceneToContinueGame(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size,bot: self.bot)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
    func changeSceneToHowTo(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameSceneHowTo(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
}

func mkLabel(s: String, si: CGFloat, cr: SKColor, po: CGPoint) -> SKLabelNode {
    let label = SKLabelNode()
    label.text = s
    label.fontSize = si
    label.fontColor = cr
    label.position = po
    
    return label
}
