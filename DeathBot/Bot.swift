
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
    var status: String

    
    init(gender: String, location: String) {
       
        age = 0
        self.gender = gender
        self.location = location
        happiness = Int(arc4random()) % 50 + 50
        health = Int(arc4random()) % 50 + 50
        smoker = 0
        drinker = 0
        status = "toddler"
    }
    
    
    func grow_month(){
        self.month++
        if month >= 36 && month < 156 {
            status = "child"
        }
        else if month >= 156 && month < 240 {
            status = "teen"
        }
        else if month >= 240 && month < 660 {
            status = "adult"
        }
        else if month >= 660 && month < 960 {
            status = "senior"
        }
        else if month >= 960 {
            status = "oldie"
        }
    }
    
    
    func take(food: String){
        switch food {
            case "icecream":
                self.happiness += 5
                self.health += 5
            case "hamburger":
                self.happiness += 5
                self.health -= 5
            case "pizza":
                self.happiness += 5
                self.health += 5
            case "hamburger":
                self.happiness += 5
                self.health -= 5
            case "donut":
                self.happiness += 5
                self.health += 5
            case "milk":
                self.happiness += 5
                self.health -= 5
            case "coffee":
                self.happiness += 5
                self.health += 5
            case "cigarette":
                self.happiness += 5
                self.health -= 5
            case "icecream":
                self.happiness += 5
                self.health += 5
            case "hamburger":
                self.happiness += 5
                self.health -= 5
            case "pizza":
                self.happiness += 5
                self.health += 5
            case "hamburger":
                self.happiness += 5
                self.health -= 5
            case "donut":
                self.happiness += 5
                self.health += 5
            case "milk":
                self.happiness += 5
                self.health -= 5
            case "coffee":
                self.happiness += 5
                self.health += 5
            case "cigarette":
                self.happiness += 5
                self.health -= 5
            case "donut":
                self.happiness += 5
                self.health += 5
            case "milk":
                self.happiness += 5
                self.health -= 5
            case "coffee":
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







