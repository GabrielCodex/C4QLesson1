//: Playground - noun: a place where people can play

import Foundation

class KitchenAppliance {
    let isInKitchen = true
}

class Knife: KitchenAppliance {
    func chop(_ food: [Food] ) {
        print("Ow!")
    }
}

class Fridge: KitchenAppliance {
    var powerOn = false
    var foodInside = [Food]()

    func flipPower() {
        powerOn = !powerOn
    }
    
    func add(_ food: Food) {
        foodInside.append(food)
        guard powerOn else {return}
        food.refrigerate()
    }
}

class Dicer: KitchenAppliance {
    var powerOn = false

    func flipPower() {
        powerOn = !powerOn
    }

    func chop(_ food: [Food]) {
        guard powerOn else {return}
        for _ in food {
            print("Chop suey!")
        }
    }
}

protocol Chop {
    func chop(_ food: Food)
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





