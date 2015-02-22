//
//  newGameScene.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/18/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation
import SpriteKit

class NewGameScene: SKScene {
    var gender: String?
    override init(size: CGSize) {
        super.init(size: size)
        
        let ratio = 1/self.size.height*195
        
        
        var newGameBG = SKSpriteNode(imageNamed: "gender_bg.png")
        newGameBG.size.height = self.size.height
        newGameBG.size.width = self.size.width
        newGameBG.anchorPoint = CGPoint(x:0, y:0)
        newGameBG.zPosition = 1
        addChild(newGameBG)

        var maleBot = SKSpriteNode(imageNamed: "male_button.png")
        maleBot.xScale = 0.5
        maleBot.yScale = 0.5
        maleBot.position = CGPoint(x:self.size.width*(0.3), y:self.size.height*0.5)
        maleBot.zPosition = 10
        var maleBot_ = SKSpriteNode(imageNamed: "male_button_.png")
        maleBot_.xScale = 0.5
        maleBot_.yScale = 0.5
        maleBot_.position = CGPoint(x:self.size.width*(0.3), y:self.size.height*0.5)
        maleBot_.zPosition = 10

        var femaleBot = SKSpriteNode(imageNamed: "female_button.png")
        femaleBot.xScale = 0.5
        femaleBot.yScale = 0.5
        femaleBot.position = CGPoint(x:self.size.width*(0.70), y:self.size.height*0.5)
        femaleBot.zPosition = 10
        var femaleBot_ = SKSpriteNode(imageNamed: "female_button_.png")
        femaleBot_.xScale = 0.5
        femaleBot_.yScale = 0.5
        femaleBot_.position = CGPoint(x:self.size.width*(0.70), y:self.size.height*0.5)
        femaleBot_.zPosition = 10
    
        var backButton = SKSpriteNode(imageNamed: "landing_back_button.png")
        backButton.size.height *= ratio
        backButton.size.width *= ratio
        backButton.position = CGPoint(x:self.size.width*(0.057), y:self.size.height*0.78)
        backButton.zPosition = 10
        var backButton_ = SKSpriteNode(imageNamed: "landing_back_button__360.png")
        backButton_.size.height *= ratio
        backButton_.size.width *= ratio
        backButton_.position = CGPoint(x:self.size.width*(0.90), y:self.size.height*0.9)
        backButton_.zPosition = 10
        
        let goBack:ActionButton = ActionButton(defaultButtonImage: backButton, activeButtonImage: backButton_, buttonAction: goBackToStart)
        addChild(goBack)
        
        let maleB:ActionButton = ActionButton(defaultButtonImage: maleBot, activeButtonImage: maleBot_, buttonAction: pickedMaleGoToLocationSence)
        addChild(maleB)
        
        let femaleB:ActionButton = ActionButton(defaultButtonImage: femaleBot, activeButtonImage: femaleBot_, buttonAction: pickedFemaleGoToLocationSence)
        addChild(femaleB)
        
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
    
    func pickedMaleGoToLocationSence(){
        self.gender = "Male"
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = LocationScene(size: self.size, gender: self.gender!)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    func pickedFemaleGoToLocationSence(){
        self.gender = "Female"
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = LocationScene(size: self.size, gender: self.gender!)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
}

