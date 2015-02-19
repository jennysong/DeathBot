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
    
    
    override init(size: CGSize) {
        super.init(size: size)
        var bot = botDataManager.get()
        println("\(bot.gender),\(bot.location)")
        let ratio = 1/self.size.height*195
        
        var background = SKSpriteNode(imageNamed: "background")
        background.size.height = self.size.height
        background.size.width = self.size.width
        background.anchorPoint = CGPoint(x:0, y:0)
        
        var backgroundTalkbox = SKSpriteNode(imageNamed: "backgroundTalkbox")
        backgroundTalkbox.size.height = self.size.height * 0.65312
        backgroundTalkbox.size.width = self.size.width * 0.49817
        backgroundTalkbox.position = CGPoint(x:self.size.width*(0.35), y:self.size.height*0.55)
        
        addChild(background)
        addChild(backgroundTalkbox)

        var buttonNewGame = SKSpriteNode(imageNamed: "buttonNewGame")
        buttonNewGame.size.height = self.size.height * 0.3397
        buttonNewGame.size.width = self.size.width * 0.336
        buttonNewGame.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.42)
        
        var buttonNewGame_ = SKSpriteNode(imageNamed: "buttonNewGame_")
        buttonNewGame_.size.height = self.size.height * 0.3397
        buttonNewGame_.size.width = self.size.width * 0.336
        buttonNewGame_.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.42)
        
        var buttonContinue = SKSpriteNode(imageNamed: "buttonContinue")
        buttonContinue.size.height = self.size.height * 0.3397
        buttonContinue.size.width = self.size.width * 0.336
        buttonContinue.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.42)
        
        var buttonContinue_ = SKSpriteNode(imageNamed: "buttonContinue_")
        buttonContinue_.size.height = self.size.height * 0.3397
        buttonContinue_.size.width = self.size.width * 0.336
        buttonContinue_.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.22)
        
        var buttonHowTo = SKSpriteNode(imageNamed: "buttonHowTo")
        buttonHowTo.size.height = self.size.height * 0.287
        buttonHowTo.size.width = self.size.width * 0.161379
        buttonHowTo.position = CGPoint(x:self.size.width*(0.10), y:self.size.height*0.15)
        var buttonHowTo_ = SKSpriteNode(imageNamed: "buttonHowTo_")
        buttonHowTo_.size.height = self.size.height * 0.287
        buttonHowTo_.size.width = self.size.width * 0.161379
        buttonHowTo_.position = CGPoint(x:self.size.width*(0.10), y:self.size.height*0.15)
        
        let newGame:ActionButton = ActionButton(defaultButtonImage: buttonNewGame, activeButtonImage: buttonNewGame_, buttonAction: changeSceneToNewGame)
        
        let continueGame:ActionButton = ActionButton(defaultButtonImage: buttonContinue, activeButtonImage: buttonContinue_, buttonAction: changeSceneToContinueGame)
        
        let howTo:ActionButton = ActionButton(defaultButtonImage: buttonHowTo, activeButtonImage: buttonHowTo_, buttonAction: changeSceneToHowTo)
        addChild(newGame)
        addChild(continueGame)
        addChild(howTo)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeSceneToNewGame(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = NewGameScene(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    func changeSceneToContinueGame(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size)
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
