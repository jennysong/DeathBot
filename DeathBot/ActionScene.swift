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
    var actions: Array<AnyObject>

    var deathArray1: NSArray?
    var deathArray2: NSArray?
    var deathArray3: NSArray?
    var deathArray4: NSArray?
    var deathArray5: NSArray?
    
    
    init(size: CGSize, bot: Bot, actions: Array<AnyObject>? = nil) {
        self.actions = actions!
        super.init(size: size)
        Jenny = bot
        
        for (index, action) in enumerate(actions as Array<NSDictionary>) {
            self.render_action_item(action, index: index)
        }
        
        self.render_dialog_body()
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
    
    func render_action_item(action: NSDictionary, index: Int) {
        
        var title = action["title"]! as String
        var deaths = action["deaths"]! as NSArray
        var risk = howRisky(deaths.count)
        
        var item_node = SKSpriteNode(imageNamed: "action_list_item_bg_\(risk).png")
        var item_label = SKLabelNode(fontNamed:"HelveticaNeue-Bold")
        var item_node_pressed = SKSpriteNode(imageNamed: "action_list_item_bg_\(risk).png")
        
        var base_x = Double(99.5)
        var base_y = 293.5-46*Double(index)
        
        var button_callback = { () -> Void in

            self.runAction(SKAction.sequence([SKAction.runBlock() {
                let revel = SKTransition.crossFadeWithDuration(0.5)
                let scene = ActionDetailScene(size: self.size, bot: self.Jenny!,  risk: risk, action: action, actions: self.actions)
                self.view?.presentScene(scene, transition: revel)
                }]))
        }
        
        item_node.xScale = 0.5
        item_node.yScale = 0.5
        item_node.position = CGPoint(x: base_x, y: base_y)
        item_node.anchorPoint = CGPoint(x:0, y:1)
        item_node.zPosition = 30
        
        item_node_pressed.xScale = 0.5
        item_node_pressed.yScale = 0.5
        item_node_pressed.position = CGPoint(x: base_x, y: base_y)
        item_node_pressed.zPosition = 31
        item_node_pressed.anchorPoint = CGPoint(x:0, y:1)
        

        let action:ActionButton = ActionButton(defaultButtonImage: item_node, activeButtonImage: item_node_pressed, buttonAction: button_callback)
        addChild(action)
        
        
        item_label.text = title
        item_label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.Left
        item_label.fontSize = 17
        item_label.fontColor = SKColor.blackColor()
        item_label.position = CGPoint(x: base_x + 48, y: base_y - 24)
        item_label.zPosition = 31
        addChild(item_label)
        
    }
    
    func render_dialog_body() {
        
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
    }
    
    
    func howRisky(numb: Int) -> String{
        if numb == 1 {return "low"}
        else if numb == 2 {return "medium"}
        else {return "high"}
    }
    
}


