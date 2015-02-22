//
//  GameScene2.swift
//  WhatDoWeDoNow
//
//  Created by Younsuk Oh on 1/24/15.
//  Copyright (c) 2015 OS. All rights reserved.
//

import Foundation
import SpriteKit

class GameSceneHowTo: SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let ratio = 1/self.size.height*195
        
        
        var infoBackground = SKSpriteNode(imageNamed: "about_bg_720.png")
        infoBackground.size.height = self.size.height
        infoBackground.size.width = self.size.width
        infoBackground.anchorPoint = CGPoint(x:0, y:0)
        infoBackground.zPosition = 1
        addChild(infoBackground)
        
        
        var backButton = SKSpriteNode(imageNamed: "landing_back_button.png")
        backButton.setScale(0.5)
        backButton.position = CGPoint(x:self.size.width*(0.057), y:self.size.height*0.88)
        backButton.zPosition = 10
        var backButton_ = SKSpriteNode(imageNamed: "landing_back_button__360.png")
        backButton_.setScale(0.5)
        backButton_.position = CGPoint(x:self.size.width*(0.057), y:self.size.height*0.88)
        backButton_.zPosition = 10
        let goBack:ActionButton = ActionButton(defaultButtonImage: backButton, activeButtonImage: backButton_, buttonAction: goBackToStart)
        addChild(goBack)
        
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
    
}





