
import Foundation

let ACTIONDEATHPORTION = 0.79
let AGEDEATHPORTION = 0.1
let GENDERDEATHPORTION = 0.01
let LOCATIONDEATHPORTION = 0.1

class Bot {
    var age: Int
    var gender: String
    var location: String
    var happiness: Int
    var health: Int
    var smoker: Int
    var drinker: Int

    
    init(gender: String, location: String) {
       
        age = 0
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
        var result = calculateDeathRate(action)
        println("\(self.gender) \(self.age) year olds, Bot is \(action)ing, DeathRate = \(result)")
        //TO DO
    }
    
    private func calculateDeathRate(action: String) -> Double{
        var result: Double = 0.0
        
        result += getActionDeathRate(action) * ACTIONDEATHPORTION
        result += DeathRateByAge(age: self.age).rate() * AGEDEATHPORTION
        result += DeathRateByGender(gender: self.gender).rate() * GENDERDEATHPORTION
        result += DeathRateByProvince(province: self.location).rate() * LOCATIONDEATHPORTION
        return result
    }
    
    private func getActionDeathRate(action: String)->Double{
        return 0.0
    }
}







