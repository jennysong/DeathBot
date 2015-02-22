//
//  ActionDatailScene.swift
//  DeathBot
//
//  Created by Jenny Song on 2015-02-22.
//  Copyright (c) 2015 SOJUniverse. All rights reserved.
//

import Foundation
import SpriteKit

class ActionDetailScene: SKScene {
    var Jenny: Bot?
    var deathList: NSArray?
    var action: NSDictionary
    var risk: String
    var actions: Array<AnyObject>
    var botDataManager = BotDataManager()
    init(size: CGSize, bot: Bot, risk: String, action: NSDictionary, actions: Array<AnyObject>? = nil) {
        self.action  = action
        self.actions = actions!
        self.risk    = risk
        
        super.init(size: size)
        Jenny = bot
        
        var actionTitle = action["title"] as String
        var actionRisk = risk
        var actionPossibleRisk: Array<String> = []
        
        for death in action["deaths"] as Array<NSDictionary> {
            actionPossibleRisk.append(death["causal"] as String)
        }
        var riskLabel = 1
        
        if actionRisk == "high" {riskLabel = 3}
        else if actionRisk == "medium" {riskLabel = 2}
        else {riskLabel = 1}
        
        
        var darkBG = SKSpriteNode(imageNamed: "action_modal_bg2.png")
        darkBG.size.height = self.size.height
        darkBG.size.width = self.size.width
        darkBG.anchorPoint = CGPoint(x:0, y:0)
        darkBG.zPosition = 15
        addChild(darkBG)
        
        
        
        var action_confirm_dialog_bg = SKSpriteNode(imageNamed: "action_confirm_dialog_bg.png")
        action_confirm_dialog_bg.xScale = 0.5
        action_confirm_dialog_bg.yScale = 0.5
        action_confirm_dialog_bg.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.5 * Double(self.frame.height))
        action_confirm_dialog_bg.zPosition = 20
        addChild(action_confirm_dialog_bg)
        
    
        
        var action_back_button = SKSpriteNode(imageNamed: "action_back_button.png")
        action_back_button.xScale = 0.5
        action_back_button.yScale = 0.5
        action_back_button.position = CGPoint(x:0.15 * Double(self.frame.width), y: 0.5 * Double(self.frame.height))
        action_back_button.zPosition = 25
        var action_back_button_ = SKSpriteNode(imageNamed: "action_back_button_.png")
        action_back_button_.xScale = 0.5
        action_back_button_.yScale = 0.5
        action_back_button_.position = CGPoint(x:0.15 * Double(self.frame.width), y: 0.5 * Double(self.frame.height))
        action_back_button_.zPosition = 25
        let back_to_actionscene:ActionButton = ActionButton(defaultButtonImage: action_back_button, activeButtonImage: action_back_button_, buttonAction: goback_to_actionscene)
        addChild(back_to_actionscene)
        

        var action_confirm_button = SKSpriteNode(imageNamed: "action_confirm_button")
        action_confirm_button.xScale = 0.5
        action_confirm_button.yScale = 0.5
        action_confirm_button.position = CGPoint(x:0.85 * Double(self.frame.width), y: 0.5 * Double(self.frame.height))
        action_confirm_button.zPosition = 25
        var action_confirm_button_ = SKSpriteNode(imageNamed: "action_confirm_button_.png")
        action_confirm_button_.xScale = 0.5
        action_confirm_button_.yScale = 0.5
        action_confirm_button_.position = CGPoint(x:0.85 * Double(self.frame.width), y: 0.5 * Double(self.frame.height))
        action_confirm_button_.zPosition = 25
        let confirm_button:ActionButton = ActionButton(defaultButtonImage: action_confirm_button, activeButtonImage: action_confirm_button_, buttonAction: goto_action_result) //fixx
        addChild(confirm_button)
        
        
        var action_confirm = SKSpriteNode(imageNamed: "action_confirm_\(actionRisk).png")
        action_confirm.xScale = 0.5
        action_confirm.yScale = 0.5
        action_confirm.position = CGPoint(x:0.5 * Double(self.frame.width), y: 0.68 * Double(self.frame.height))
        action_confirm.zPosition = 25
        addChild(action_confirm)
        
        var action_age_reward = SKSpriteNode(imageNamed: "action_age_reward.png")
        action_age_reward.xScale = 0.5
        action_age_reward.yScale = 0.5
        action_age_reward.position = CGPoint(x:0.85 * Double(self.frame.width), y: 0.72 * Double(self.frame.height))
        action_age_reward.zPosition = 25
        addChild(action_age_reward)
        
        var action_age_reward_label = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        action_age_reward_label.text = "+ \(riskLabel)"
        action_age_reward_label.fontSize = 20
        action_age_reward_label.fontColor = UIColor(red:0.549, green:0.776, blue:0.247, alpha:1.0)
        action_age_reward_label.position = CGPoint(x:0.85 * Double(self.frame.width), y: 0.717 * Double(self.frame.height))
        action_age_reward_label.zPosition = 30
        addChild(action_age_reward_label)
        
        var actionlabel = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        actionlabel.text = actionTitle
        actionlabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        actionlabel.fontSize = 20
        actionlabel.fontColor = SKColor.blackColor()
        actionlabel.position = CGPoint(x:0.365 * Double(self.frame.width), y: 0.645 * Double(self.frame.height))
        actionlabel.zPosition = 25
        addChild(actionlabel)
        
        for index in 0...actionPossibleRisk.count-1 {
            var possibleRisk = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
            possibleRisk.text = "- \(actionPossibleRisk[index])"
            possibleRisk.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
            possibleRisk.fontSize = 15
            possibleRisk.fontColor = SKColor.blackColor()
            possibleRisk.position = CGPoint(x:0.32 * Double(self.frame.width), y: (0.46-Double(index)*0.06) * Double(self.frame.height))
            possibleRisk.zPosition = 25
            addChild(possibleRisk)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func goback_to_actionscene(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.crossFadeWithDuration(0.5)
            let scene = ActionScene(size: self.size, bot: self.Jenny!, actions: self.actions)
            self.view?.presentScene(scene, transition: revel)
            }]))

    }
    
    func goto_action_result(){
        runAction(SKAction.sequence([SKAction.runBlock() {
            let revel = SKTransition.crossFadeWithDuration(0.5)
            let scene = ActionSuccessScene(size: self.size, bot: self.Jenny!)
            self.view?.presentScene(scene, transition: revel)
            }]))
    }
}