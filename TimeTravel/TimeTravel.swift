//
//  TimeTravel.swift
//  TimeTravel
//
//  Created by Jhantelle Belleza on 10/4/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

enum Speed: Double {
    case none = 0
    case slow = 50
    case medium = 150
    case fast = 1000
    case lightSpeed = 1000000
    
    init(spaceSpeed: Double) {
        switch spaceSpeed {
        case 0...49:
           self = .none
        case 50...149:
           self = .slow
        case 150...999:
            self = .medium
        case 1000...999999:
            self = .fast
        default:
            self = .lightSpeed
        }
    }
    
    var isTravellingLightSpeed: Bool {
        return self.rawValue == 1000000
    }
    
    func isfaster(than speed: Speed) -> Bool {
        return self.rawValue > speed.rawValue
    }
}

enum Weather {
    case cold
    case warm
    case hot
    case superDuperHot
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    
    var hasLife: Bool {
        return self.rawValue == 3 || self.rawValue == 4
    }
    
    var weather: Weather {
        switch self {
        case .mercury:
            return .superDuperHot
        case .venus:
            return .superDuperHot
        case .earth:
            return .warm
        case .mars:
            return .cold
        case .jupiter:
            return .cold
        case .saturn:
            return .cold
        case .uranus:
            return .cold
        case .neptune:
            return .cold
            
        }
    }
}

class SpaceShip {
    var name: String
    var speed: Speed = .none
    var currentPlanet: Planet
    var description: String {
        return "This is Space Ship \(name)! Our current speed is \(speed). The planet we are at is \(currentPlanet))"
    }
    init(name: String, planet: Planet) {
        self.name = name
        self.currentPlanet = planet
    }
    
    func timeTravel () -> Bool {
        return self.speed.isTravellingLightSpeed
    }
    
    func isFaster(than otherShip: SpaceShip) -> Bool {
        return self.speed.isfaster(than: otherShip.speed)
    }
    
    func travel(to planet: Planet) -> Bool {
        
        var madeIt: Bool
        
        if self.speed.rawValue == Speed.lightSpeed.rawValue &&
           ( planet == .neptune || planet == .venus ) {
             self.currentPlanet = .mars
             return true }
        
        
        
        switch planet {
        case .mercury:
            return false
        case .venus, .earth, .neptune:
            madeIt = self.speed.rawValue >=  Speed.fast.rawValue
        case .mars:
            madeIt = self.speed.rawValue >=  Speed.lightSpeed.rawValue
        case .jupiter, .uranus:
            madeIt = self.speed.rawValue >=  Speed.slow.rawValue
        case .saturn:
            madeIt = self.speed.rawValue >=  Speed.medium.rawValue
        }
        
        if madeIt { currentPlanet = planet }
        return madeIt
        
    }
}














