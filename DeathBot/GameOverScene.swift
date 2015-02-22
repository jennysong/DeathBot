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
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let ratio = 1/self.size.height*195
        
        
        var gameOverBG = SKSpriteNode(imageNamed: "gaveOverBG")
        gameOverBG.size.height = self.size.height
        gameOverBG.size.width = self.size.width
        gameOverBG.anchorPoint = CGPoint(x:0, y:0)
        gameOverBG.zPosition = 1
        addChild(gameOverBG
        )
        
        
        var backButton = SKSpriteNode(imageNamed: "backButton")
        backButton.size.height *= ratio
        backButton.size.width *= ratio
        backButton.position = CGPoint(x:self.size.width*(0.90), y:self.size.height*0.9)
        backButton.zPosition = 10
        var backButton_ = SKSpriteNode(imageNamed: "backButton_")
        backButton_.size.height *= ratio
        backButton_.size.width *= ratio
        backButton_.position = CGPoint(x:self.size.width*(0.90), y:self.size.height*0.9)
        backButton_.zPosition = 10
        println("here is back button")
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
