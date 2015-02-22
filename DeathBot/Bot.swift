
import Foundation

let ACTIONDEATHPORTION = 0.79
let AGEDEATHPORTION = 0.1
let GENDERDEATHPORTION = 0.01
let LOCATIONDEATHPORTION = 0.1

class Bot : NSObject, NSCoding{
    var age: Int
    //var month: Int
    var gender: String
    var location: String
    var happiness: Int
    var health: Int
    var smoker: Int
    var drinker: Int
    var status: String
    var dead: Bool
    
    func encodeWithCoder(aCoder: NSCoder) {
        //
        aCoder.encodeObject(age, forKey: "age")
        aCoder.encodeObject(gender, forKey: "gender")
        aCoder.encodeObject(location, forKey: "location")
        aCoder.encodeObject(happiness, forKey: "happiness")
        aCoder.encodeObject(health, forKey: "health")
        aCoder.encodeObject(smoker, forKey: "smoker")
        aCoder.encodeObject(drinker, forKey: "drinker")
        aCoder.encodeObject(status, forKey: "status")
        aCoder.encodeObject(dead, forKey: "dead")
    }
    required init(coder aDecoder: NSCoder) {
        //
        //month = 0
        self.age = aDecoder.decodeObjectForKey("age")! as Int
        gender = aDecoder.decodeObjectForKey("gender")! as String
        location = aDecoder.decodeObjectForKey("location")! as String
        happiness = aDecoder.decodeObjectForKey("happiness")! as Int
        health = aDecoder.decodeObjectForKey("health")! as Int
        smoker = aDecoder.decodeObjectForKey("smoker")! as Int
        drinker = aDecoder.decodeObjectForKey("drinker")! as Int
        status = aDecoder.decodeObjectForKey("status")! as String
        dead = aDecoder.decodeObjectForKey("dead")! as Bool
    }
    
    init(gender: String, location: String) {
       
        //month = 0
        age = 0
        self.gender = gender
        self.location = location
        happiness = 50
        health = 50
        smoker = 0
        drinker = 0
        status = "toddler"
        dead = false
    }
    
    func grow_age(){
        self.age++
        
        if age >= 3 && age < 13 {
            status = "child"
        }
        else if age >= 13 && age < 20 {
            status = "teenager"
        }
        else if age >= 20 && age < 55 {
            status = "adult"
        }
        else if age >= 55 && age < 80 {
            status = "senior"
        }
        else if age >= 80 {
            status = "golden-oldie"
        }
    }
    
    
    func take(food: String) -> (Double, String){

        switch food {
            case "burger":
                self.happiness += 5
                self.health -= 10
            case "cherry":
                self.happiness += 0
                self.health += 50
            case "banana":
                self.happiness += 0
                self.health += 50
            case "fish":
                self.happiness += 5
                self.health += 50
            case "apple":
                self.happiness += 5
                self.health += 50
            case "milk":
                self.happiness -= 10
                self.health += 50
            case "chicken":
                self.happiness += 5
                self.health += 50
            case "pepper":
                self.happiness -= 15
                self.health += 50
            case "grape":
                self.happiness += 5
                self.health += 50
            case "egg":
                self.happiness += 5
                self.health += 50
            case "carrot":
                self.happiness -= 10
                self.health += 50
            case "softdrink":
                self.happiness += 5
                self.health -= 10
            case "lobster":
                self.happiness += 5
                self.health += 50
            case "cheese":
                self.happiness += 5
                self.health += 50
            case "bread":
                self.happiness += 5
                self.health += 50
            case "cigarette":
                self.happiness += 5
                self.health -= 10
                self.smoker += 20
            case "alcohol":
                self.happiness += 5
                self.health -= 10
                self.drinker += 20
            case "donut":
                self.happiness += 5
                self.health -= 5
            case "pizza":
                self.happiness += 5
                self.health -= 5
            case "drug":
                self.happiness += 20
                self.health -= 15
            default:
                break
        }
        if self.happiness>=100 {self.happiness = 100}
        return calculateDeathRate("take")
    }
    private func calculateDeathRate(action: String) -> (Double,String){
        var result: Double = 0.0
        var health: Double = ((100.0 - (Double(self.health))) / 100.0)
        result += getActionDeathRate(action) * ACTIONDEATHPORTION * health
        result += DeathRateByAge(age: self.age).rate() * AGEDEATHPORTION
        result += DeathRateByGender(gender: self.gender).rate() * GENDERDEATHPORTION
        result += DeathRateByProvince(province: self.location).rate() * LOCATIONDEATHPORTION
        return (result,action)
    }
    
    private func getActionDeathRate(action: String)->Double{
        switch action {
            case "take":
                return 0.005
        default:
                return 0.0
        }
    }
}







