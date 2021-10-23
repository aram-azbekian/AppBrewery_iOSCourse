
protocol CanFly {
    func fly()
}

class Bird {
    var isFemale = true
    
    func layEgg() {
        if isFemale {
            print("The bird makes new baby in the shell")
        }
    }
    
}

class Penguin: Bird {
    
    func swim() {
        print("The penguin paddles through the water")
    }
}

class Eagle: Bird, CanFly {
    
    func fly() {
        print("The eagle flaps its wings and flies into the sky")
    }
    
    func soar() {
        print("The eagle glides in the air.")
    }
}

struct FlyingMuseum {
    func flyingDemo(flyingObject: CanFly) {
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The airplane uses engine to lift off to the air.")
    }
}

let myEagle = Eagle()
myEagle.fly()

let myPenguin = Penguin()

let myPlane = Airplane()
myPlane.fly()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)
