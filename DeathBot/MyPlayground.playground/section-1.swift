// Playground - noun: a place where people can play

import UIKit

var actionList = [1,2,3,4,5]
var randNum1:Int!
var randNum2:Int!
var randNum3:Int!
var randNum4:Int!
var randNum5:Int!
var actionOne:Int!
var actionTwo:Int!
var actionThree:Int!
var actionFour:Int!
var actionFive:Int!


if actionList.count >= 5 {
    randNum1 = Int(arc4random()) % actionList.count
    actionOne = actionList[randNum1]
    actionList.removeAtIndex(randNum1)
    randNum2 = Int(arc4random()) % actionList.count
    actionTwo = actionList[randNum2]
    actionList.removeAtIndex(randNum2)
    randNum3 = Int(arc4random()) % actionList.count
    actionThree = actionList[randNum3]
    actionList.removeAtIndex(randNum3)
    randNum4 = Int(arc4random()) % actionList.count
    actionFour = actionList[randNum4]
    actionList.removeAtIndex(randNum4)
    randNum5 = Int(arc4random()) % actionList.count
    actionFive = actionList[randNum5]
}