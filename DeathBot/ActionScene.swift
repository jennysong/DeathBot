//
//  ActionScene.swift
//  DeathBot
//
//  Created by Jenny Song on 2015-02-22.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//


import Foundation
import SpriteKit

class ActionScene: SKScene {
    var Jenny: Bot?
    var botDataManager = BotDataManager()

    init(size: CGSize, bot: Bot) {
        super.init(size: size)
        Jenny = bot

        
       
        
        var uri = NSURL(string: "http://code.shawnjung.ca/actions/search?age=\(Jenny!.age)&gender=\(Jenny!.gender)&province=\(Jenny!.location)")
        let webRequest = NSMutableURLRequest(URL: uri!)
        webRequest.HTTPMethod = "GET"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(webRequest) {(data, response, error) in
            if let result = NSString(data: data, encoding: NSUTF8StringEncoding) {
                println(result)
            }
            else {
                println("alert")
            }
        }
        task.resume()
        
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        var actiontitle1 = "Go Camping"
        var actionrisk1 = "high"
        var actiontitle2 = "Go on a date"
        var actionrisk2 = "low"
        var actiontitle3 = "Go Fishing"
        var actionrisk3 = "medium"
        var actiontitle4 = "Go to a museum"
        var actionrisk4 = "high"
        var actiontitle5 = "Get a Girlfriend"
        var actionrisk5 = "low"
        
        var darkBG = SKSpriteNode(imageNamed: "action_modal_bg2.png")
        darkBG.size.height = self.size.height
        darkBG.size.width = self.size.width
        darkBG.anchorPoint = CGPoint(x:0, y:0)
        darkBG.zPosition = 15
        addChild(darkBG)
        
        var action_list_close_button = SKSpriteNode(imageNamed: "action_list_close_button.png")
        action_list_close_button.xScale = 0.5
        action_list_close_button.yScale = 0.5
        action_list_close_button.position = CGPoint(x:0.8 * Double(self.frame.width), y: 0.85 * Double(self.frame.height))
        action_list_close_button.zPosition = 25
        var action_list_close_button_ = SKSpriteNode(imageNamed: "action_list_close_button_.png")
        action_list_close_button_.xScale = 0.5
        action_list_close_button_.yScale = 0.5
        action_list_close_button_.position = CGPoint(x:0.8 * Double(self.frame.width), y: 0.85 * Double(self.frame.height))
        action_list_close_button_.zPosition = 25
        let action_list_close:ActionButton = ActionButton(defaultButtonImage: action_list_close_button, activeButtonImage: action_list_close_button_, buttonAction: action_list_close_call)
        addChild(action_list_close)
        
        var action_list_dialog_bg = SKSpriteNode(imageNamed: "action_list_dialog_bg.png")
        action_list_dialog_bg.xScale = 0.5
        action_list_dialog_bg.yScale = 0.5
        action_list_dialog_bg.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.5 * Double(self.frame.height))
        action_list_dialog_bg.zPosition = 20
        addChild(action_list_dialog_bg)
        
        var action_list_item_1 = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk1).png")
        action_list_item_1.xScale = 0.5
        action_list_item_1.yScale = 0.5
        action_list_item_1.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.725 * Double(self.frame.height))
        action_list_item_1.zPosition = 20
        var action_list_item_1_ = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk1).png")
        action_list_item_1_.xScale = 0.5
        action_list_item_1_.yScale = 0.5
        action_list_item_1_.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.725 * Double(self.frame.height))
        action_list_item_1_.zPosition = 20
        let action_1:ActionButton = ActionButton(defaultButtonImage: action_list_item_1, activeButtonImage: action_list_item_1_, buttonAction: action1)
        addChild(action_1)
        
        
        var action_list_item_2 = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk2).png")
        action_list_item_2.xScale = 0.5
        action_list_item_2.yScale = 0.5
        action_list_item_2.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.6 * Double(self.frame.height))
        action_list_item_2.zPosition = 20
        var action_list_item_2_ = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk2).png")
        action_list_item_2_.xScale = 0.5
        action_list_item_2_.yScale = 0.5
        action_list_item_2_.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.6 * Double(self.frame.height))
        action_list_item_2_.zPosition = 20
        let action_2:ActionButton = ActionButton(defaultButtonImage: action_list_item_2, activeButtonImage: action_list_item_2_, buttonAction: action2)
        addChild(action_2)
        
        var action_list_item_3 = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk3).png")
        action_list_item_3.xScale = 0.5
        action_list_item_3.yScale = 0.5
        action_list_item_3.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.475 * Double(self.frame.height))
        action_list_item_3.zPosition = 20
        var action_list_item_3_ = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk3).png")
        action_list_item_3_.xScale = 0.5
        action_list_item_3_.yScale = 0.5
        action_list_item_3_.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.475 * Double(self.frame.height))
        action_list_item_3_.zPosition = 20
        let action_3:ActionButton = ActionButton(defaultButtonImage: action_list_item_3, activeButtonImage: action_list_item_3_, buttonAction: action3)
        addChild(action_3)
        
        var action_list_item_4 = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk4).png")
        action_list_item_4.xScale = 0.5
        action_list_item_4.yScale = 0.5
        action_list_item_4.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.35 * Double(self.frame.height))
        action_list_item_4.zPosition = 20
        var action_list_item_4_ = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk4).png")
        action_list_item_4_.xScale = 0.5
        action_list_item_4_.yScale = 0.5
        action_list_item_4_.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.35 * Double(self.frame.height))
        action_list_item_4_.zPosition = 20
        let action_4:ActionButton = ActionButton(defaultButtonImage: action_list_item_4, activeButtonImage: action_list_item_4_, buttonAction: action4)
        addChild(action_4)
        
        var action_list_item_5 = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk5).png")
        action_list_item_5.xScale = 0.5
        action_list_item_5.yScale = 0.5
        action_list_item_5.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.225 * Double(self.frame.height))
        action_list_item_5.zPosition = 20
        var action_list_item_5_ = SKSpriteNode(imageNamed: "action_list_item_bg_\(actionrisk5).png")
        action_list_item_5_.xScale = 0.5
        action_list_item_5_.yScale = 0.5
        action_list_item_5_.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.225 * Double(self.frame.height))
        action_list_item_5_.zPosition = 20
        let action_5:ActionButton = ActionButton(defaultButtonImage: action_list_item_5, activeButtonImage: action_list_item_5_, buttonAction: action5)
        addChild(action_5)
        
        
        
        
        var actionlabel1 = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        actionlabel1.text = actiontitle1
        actionlabel1.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        actionlabel1.fontSize = 17
        actionlabel1.fontColor = SKColor.blackColor()
        actionlabel1.position = CGPoint(x:0.22 * Double(self.frame.width), y: 0.72 * Double(self.frame.height))
        actionlabel1.zPosition = 25
        addChild(actionlabel1)
        
        
        var actionlabel2 = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        actionlabel2.text = actiontitle2
        actionlabel2.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        actionlabel2.fontSize = 17
        actionlabel2.fontColor = SKColor.blackColor()
        actionlabel2.position = CGPoint(x:0.22 * Double(self.frame.width), y: 0.595 * Double(self.frame.height))
        actionlabel2.zPosition = 25
        addChild(actionlabel2)
        
        var actionlabel3 = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        actionlabel3.text = actiontitle3
        actionlabel3.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        actionlabel3.fontSize = 17
        actionlabel3.fontColor = SKColor.blackColor()
        actionlabel3.position = CGPoint(x:0.22 * Double(self.frame.width), y: 0.47 * Double(self.frame.height))
        actionlabel3.zPosition = 25
        addChild(actionlabel3)
        
        var actionlabel4 = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        actionlabel4.text = actiontitle4
        actionlabel4.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        actionlabel4.fontSize = 17
        actionlabel4.fontColor = SKColor.blackColor()
        actionlabel4.position = CGPoint(x:0.22 * Double(self.frame.width), y: 0.345 * Double(self.frame.height))
        actionlabel4.zPosition = 25
        addChild(actionlabel4)
        
        var actionlabel5 = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        actionlabel5.text = actiontitle5
        actionlabel5.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        actionlabel5.fontSize = 17
        actionlabel5.fontColor = SKColor.blackColor()
        actionlabel5.position = CGPoint(x:0.22 * Double(self.frame.width), y: 0.22 * Double(self.frame.height))
        actionlabel5.zPosition = 25
        addChild(actionlabel5)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func action_list_close_call(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.crossFadeWithDuration(0.5)
            let scene = GameScene(size: self.size,bot: self.Jenny!)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
    func action1(){
        action(1)
    }
    func action2(){
        action(2)
    }
    func action3(){
        action(3)
    }
    func action4(){
        action(4)
    }
    func action5(){
        action(5)
    }
    
    
    func action(numb: Int){
        println("action \(numb)!")
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.crossFadeWithDuration(0.5)
            let scene = ActionDetailScene(size: self.size, bot: self.Jenny!, action: numb)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
    
    
}


