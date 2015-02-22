//
//  MoveScene.swift
//  DeathBot
//
//  Created by Younsuk Oh on 2/19/15.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation
import SpriteKit

class MoveScene: SKScene {
    var bot: Bot?
    init(size: CGSize, bot: Bot) {
        super.init(size: size)
        self.bot = bot
        let ratio = 1/self.size.height*195
        
        var locationBG = SKSpriteNode(imageNamed: "location_background")
        locationBG.size.height = self.size.height
        locationBG.size.width = self.size.width
        locationBG.anchorPoint = CGPoint(x:0, y:0)
        locationBG.zPosition = 1
        addChild(locationBG)
        
        
        var backButton = SKSpriteNode(imageNamed: "landing_back_button.png")
        backButton.size.height *= ratio
        backButton.size.width *= ratio
        backButton.position = CGPoint(x:self.size.width*(0.057), y:self.size.height*0.88)
        backButton.zPosition = 10
        var backButton_ = SKSpriteNode(imageNamed: "landing_back_button__360.png")
        backButton_.size.height *= ratio
        backButton_.size.width *= ratio
        backButton_.position = CGPoint(x:self.size.width*(0.057), y:self.size.height*0.88)
        backButton_.zPosition = 10
        let goBack:ActionButton = ActionButton(defaultButtonImage: backButton, activeButtonImage: backButton_, buttonAction: goBackToGameScene)
        addChild(goBack)
        
        addLocation("AB", x: self.size.width*(0.275), y: self.size.height*0.73)
        addLocation("MB", x: self.size.width*(0.275), y: self.size.height*0.63)
        addLocation("NL", x: self.size.width*(0.275), y: self.size.height*0.53)
        addLocation("NS", x: self.size.width*(0.275), y: self.size.height*0.43)
        addLocation("ON", x: self.size.width*(0.275), y: self.size.height*0.33)
        addLocation("QC", x: self.size.width*(0.275), y: self.size.height*0.23)
        addLocation("YT", x: self.size.width*(0.275), y: self.size.height*0.13)
        addLocation("BC", x: self.size.width*(0.735), y: self.size.height*0.73)
        addLocation("NB", x: self.size.width*(0.735), y: self.size.height*0.63)
        addLocation("NT", x: self.size.width*(0.735), y: self.size.height*0.53)
        addLocation("NU", x: self.size.width*(0.735), y: self.size.height*0.43)
        addLocation("PE", x: self.size.width*(0.735), y: self.size.height*0.33)
        addLocation("SK", x: self.size.width*(0.735), y: self.size.height*0.23)
        //UIAlertView(title: "AAA", message: "aaa", delegate: nil, cancelButtonTitle: "Cancel", otherButtonTitles: "OK").show()
        var currentLocation = getLocationName(bot.location)
        var DRBP = DeathRateByProvince(province: bot.location).rate() * 100
        UIAlertView(title: "From \(currentLocation)", message: "The death rate by location is \(DRBP)%.\nIf you do not want to move, pick the same location.", delegate: nil, cancelButtonTitle: "OK").show()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func goBackToGameScene(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size,bot: self.bot!)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
    func addLocation(location: String,x: CGFloat, y: CGFloat){
        let ratio = 1/self.size.height*195
        var lo = SKSpriteNode(imageNamed: location)
        lo.setScale(0.5)
        lo.name = location
        lo.position = CGPoint(x: x, y: y)
        lo.zPosition = 10
        addChild(lo)
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            let touchNode = nodeAtPoint(location)
            if(touchNode.name != nil){
                self.bot?.location = touchNode.name!
                var currentLocation = getLocationName(touchNode.name!)
                var DRBP = DeathRateByProvince(province: touchNode.name!).rate() * 100
                UIAlertView(title: "To \(currentLocation)", message: "The death rate by location is \(DRBP)%.\nIf you do not want to move, pick the same location.", delegate: nil, cancelButtonTitle: "OK").show()
                GoToGameScene(touchNode.name!)
            }
        }
        
    }
    
    func GoToGameScene(location: String){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.flipHorizontalWithDuration(0.5)
            let scene = GameScene(size: self.size, bot: self.bot!)
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