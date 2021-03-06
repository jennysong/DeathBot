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

var backgroundMusicPlayer: AVAudioPlayer!

func playBackgroundMusic(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(
        filename, withExtension: nil)
    if (url == nil) {
        println("Could not find file: \(filename)")
        return
    }
    
    var error: NSError? = nil
    backgroundMusicPlayer =
        AVAudioPlayer(contentsOfURL: url, error: &error)
    if backgroundMusicPlayer == nil {
        println("Could not create audio player: \(error!)")
        return
    }
    
    backgroundMusicPlayer.numberOfLoops = -1
    backgroundMusicPlayer.prepareToPlay()
    backgroundMusicPlayer.play()
}



class Game: SKScene {
    var botDataManager = BotDataManager()
    var bot:Bot
    var buttonContinue = SKSpriteNode(imageNamed: "continue_button")
    var buttonContinue_ = SKSpriteNode(imageNamed: "continue_button_")
    override init(size: CGSize) {
        bot = botDataManager.get()
        super.init(size: size)
        
        playBackgroundMusic("humptydumpty.mp3")
        var background = SKSpriteNode(imageNamed: "landingBG")
        background.yScale = self.size.width/background.size.width
        background.size.width = self.size.width
        background.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.42 * Double(self.frame.height))
        background.zPosition = 1

        var buttonNewGame = SKSpriteNode(imageNamed: "start_button")
        buttonNewGame.yScale = 0.5
        buttonNewGame.xScale = 0.5
        buttonNewGame.position = CGPoint(x:0.37 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonNewGame.zPosition = 10
        var buttonNewGame_ = SKSpriteNode(imageNamed: "start_button_")
        buttonNewGame_.yScale = 0.5
        buttonNewGame_.xScale = 0.5
        buttonNewGame_.position = CGPoint(x:0.37 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonNewGame_.zPosition = 10
        
        
        buttonContinue.yScale = 0.5
        buttonContinue.xScale = 0.5
        buttonContinue.position = CGPoint(x:0.63 * Double(self.frame.width), y: 0.15 * Double(self.frame.height))
        buttonContinue.zPosition = 10
        
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
        
        let moveBackground = SKAction.moveTo(CGPoint(x:0.5 * Double(self.frame.width), y: 0.57 * Double(self.frame.height)), duration: NSTimeInterval(1.2))
            moveBackground.timingMode = .EaseInEaseOut
        let fadeInImages = SKAction.fadeInWithDuration(1)
  
        
        runAction(SKAction.sequence([SKAction.waitForDuration(1), SKAction.runBlock{
            background.runAction(moveBackground)},SKAction.waitForDuration(1.2),SKAction.runBlock{newGame.runAction(fadeInImages)
                continueGame.runAction(fadeInImages)
                howTo.runAction(fadeInImages)
                copyrightLabel.runAction(fadeInImages)} ]))
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeSceneToNewGame(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.fadeWithColor(SKColor.blackColor(), duration: NSTimeInterval(1.3))
            let scene = NewGameScene(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    func changeSceneToContinueGame(){
        if self.bot.dead {
            UIAlertView(title: "Already Dead!!!", message: "Please start new game.", delegate: nil, cancelButtonTitle: "OK").show()
            buttonContinue_.hidden = true
            buttonContinue.hidden = false
            
        } else {
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size,bot: self.bot)
            self.view?.presentScene(scene, transition: revel)
            }]))
        }
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
