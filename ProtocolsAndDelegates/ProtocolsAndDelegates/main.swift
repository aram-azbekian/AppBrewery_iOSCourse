
protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }

    func performCPR() {
        print("Paramedic does chest compressions.")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("Doctor does chest compressions.")
    }
    
    func useStethoscope() {
        print("Doctor listens to heart.")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive.")
    }
    
    func useElectricDrill() {
        print("Whrrr...")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio)

let angela = Surgeon(handler: emilio)
emilio.assessSituation()
emilio.medicalEmergency()
