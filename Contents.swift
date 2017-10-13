//: Playground - noun: a place where people can play

import Foundation

class Knife: Chop {
    
}

class Fridge: Electric {
    var powerOn = false
    
    var foodInside = [Expireable]()
    
    func add(_ food: Expireable) {
        var foodItem = food
        foodInside.append(foodItem)
        guard powerOn else {return}
        foodItem.refrigerate()
    }
}

class Dicer: Chop, Electric {
    var powerOn = false

    func chop(_ food: [Chopable]) {
        guard powerOn else {return}
        for _ in food {
            print("Chop suey!")
        }
    }
}

protocol Chop {
    func chop(_ food: [Chopable])
}

extension Chop {
    func chop(_ food: [Chopable] ) {
        for _ in food {
            print("Chop suey!")
        }
    }
}

protocol Electric: class {
    var powerOn: Bool {get set}
    
    func flipPower()
}

extension Electric {
    
    func flipPower() {
        powerOn = !powerOn
    }
}

protocol Expireable {
    var daysUntilExpiration: Int {get set}
    var canBeEaten: Bool {get set}
    
    mutating func refrigerate()
    mutating func expire()
    mutating func addOneDay()
}

extension Expireable {
    mutating func refrigerate() {
        daysUntilExpiration += 4
    }
    
    mutating func expire() {
        canBeEaten = false
    }
    
    mutating func addOneDay() {
        daysUntilExpiration -= 1
    }
}

protocol Chopable {
    func getChopped()
}

struct Lettuce: Expireable, Chopable {
    var daysUntilExpiration: Int
    var canBeEaten: Bool
    
    func getChopped() {
        print("Chop suey!")
    }
}

struct Egg: Expireable {
    var daysUntilExpiration: Int
    var canBeEaten: Bool
}

class CheezeIts {

}

let fridge = Fridge()
let slicer = Dicer()
let knife = Knife()

let lettuce = Lettuce(daysUntilExpiration: 4, canBeEaten: true)
let egg = Egg(daysUntilExpiration: 7, canBeEaten: true)
let cheezeIts = CheezeIts()

fridge.add(egg)
print(fridge.foodInside[0].daysUntilExpiration)






