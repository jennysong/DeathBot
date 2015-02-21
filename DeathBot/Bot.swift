
import Foundation

class Bot {
    var month: Int
    var gender: String
    var location: String
    var happiness: Int
    var health: Int
    var smoker: Int
    var drinker: Int

    
    init(gender: String, location: String) {
       
        month = 1
        self.gender = gender
        self.location = location
        happiness = Int(arc4random()) % 50 + 50
        health = Int(arc4random()) % 50 + 50
        smoker = 0
        drinker = 0
    }
    
    func take(food: String){
        
        switch food {
            case "potato":
                self.happiness += 5
                self.health += 5

            case "cigarette":
                self.happiness += 5
                self.health -= 5
            
            default:
                break
        
        }
        
    }
    
    func doAction(action: String){
        //do action.
        
        
    }
    
}







