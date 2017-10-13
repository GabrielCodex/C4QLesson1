//: Playground - noun: a place where people can play

import Foundation

class Knife: Chop {
    
}

class Fridge: Electric {
    var powerOn = false
    
    var foodInside = [Food]()
    
    func add(_ food: Food) {
        foodInside.append(food)
        guard powerOn else {return}
        food.refrigerate()
    }
}

class Dicer: Chop, Electric {
    var powerOn = false

    func chop(_ food: [Food]) {
        guard powerOn else {return}
        for _ in food {
            print("Chop suey!")
        }
    }
}

protocol Chop {
    func chop(_ food: [Food])
}

extension Chop {
    func chop(_ food: [Food] ) {
        print("Ow!")
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

class Food {
    var daysUntilExpiration = 3
    var canBeEaten = true

    func refrigerate() {
        daysUntilExpiration += 4
    }

    func expire() {
        canBeEaten = false
    }

    func addOneDay() {
        daysUntilExpiration -= 1
    }
}

class Lettuce: Food {
    var isChoppable = true
}

class Egg: Food {
    var isChoppable = false
}

class CheezeIts: Food{
    var isChoppable = false
}

let fridge = Fridge()
let slicer = Dicer()
let knife = Knife()

let lettuce = Lettuce()
let egg = Egg()
let cheezeIts = CheezeIts()





