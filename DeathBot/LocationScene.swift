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
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let ratio = 1/self.size.height*195
        
        
        var locationBG = SKSpriteNode(imageNamed: "locationBG")
        locationBG.size.height = self.size.height
        locationBG.size.width = self.size.width
        locationBG.anchorPoint = CGPoint(x:0, y:0)
        locationBG.zPosition = 1
        addChild(locationBG)
        
        var bc = SKSpriteNode(imageNamed: "bc")
        bc.size.height *= ratio
        bc.size.width *= ratio
        bc.position = CGPoint(x:self.size.width*(0.25), y:self.size.height*0.5)
        bc.zPosition = 10
        var bc_ = SKSpriteNode(imageNamed: "bc")
        bc_.size.height *= ratio
        bc_.size.width *= ratio
        bc_.position = CGPoint(x:self.size.width*(0.25), y:self.size.height*0.5)
        bc_.zPosition = 10
        
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
        
        let goBack:ActionButton = ActionButton(defaultButtonImage: backButton, activeButtonImage: backButton_, buttonAction: goBackToStart)
        addChild(goBack)
        
        let bcB:ActionButton = ActionButton(defaultButtonImage: bc, activeButtonImage: bc_, buttonAction: goToGameScene)
        addChild(bcB)
        
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
    
    func goToGameScene(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
}