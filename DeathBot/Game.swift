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
    override init(size: CGSize) {
        super.init(size: size)
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

        var buttonStart = SKSpriteNode(imageNamed: "buttonStart")
        buttonStart.size.height = self.size.height * 0.3397
        buttonStart.size.width = self.size.width * 0.336
        buttonStart.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.42)
        
        var buttonStart_ = SKSpriteNode(imageNamed: "buttonStart_")
        buttonStart_.size.height = self.size.height * 0.3397
        buttonStart_.size.width = self.size.width * 0.336
        buttonStart_.position = CGPoint(x:self.size.width*(0.80), y:self.size.height*0.42)
        
        var buttonHowTo = SKSpriteNode(imageNamed: "buttonHowTo")
        buttonHowTo.size.height = self.size.height * 0.287
        buttonHowTo.size.width = self.size.width * 0.161379
        buttonHowTo.position = CGPoint(x:self.size.width*(0.10), y:self.size.height*0.15)
        var buttonHowTo_ = SKSpriteNode(imageNamed: "buttonHowTo_")
        buttonHowTo_.size.height = self.size.height * 0.287
        buttonHowTo_.size.width = self.size.width * 0.161379
        buttonHowTo_.position = CGPoint(x:self.size.width*(0.10), y:self.size.height*0.15)
        
        let a:ActionButton = ActionButton(defaultButtonImage: buttonStart, activeButtonImage: buttonStart_, buttonAction: changeSceneToStart)
        
        let b:ActionButton = ActionButton(defaultButtonImage: buttonHowTo, activeButtonImage: buttonHowTo_, buttonAction: changeSceneToHowTo)
        addChild(a)
        addChild(b)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func changeSceneToStart(){
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
