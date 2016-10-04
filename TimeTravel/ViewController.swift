//
//  ViewController.swift
//  TimeTravel
//
//  Created by James Campagno on 10/4/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mySpaceShip = SpaceShip(name: "Voyager Panda", planet: .earth)
    @IBOutlet weak var currentPlanet: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBAction func selectSpeedClicked(_ sender: AnyObject) {
        switch mySpaceShip.speed {
        case .none:
            mySpaceShip.speed = .slow
            speed.text = "Slow: \(Speed.slow.rawValue)"
        case .slow:
            mySpaceShip.speed = .medium
            speed.text = "Medium: \(Speed.medium.rawValue)"
        case .medium:
            mySpaceShip.speed = .fast
            speed.text = "Fast: \(Speed.fast.rawValue)"
        case .fast:
            mySpaceShip.speed = .lightSpeed
            speed.text = "Light Speed!!!"
        case .lightSpeed:
            mySpaceShip.speed = .none
            speed.text = "none: \(Speed.none.rawValue)"
        }
    }
    
    @IBAction func planetSelected(_ sender: UIButton) {
        var selectedPlanet: Planet = mySpaceShip.currentPlanet
        
        if let tag = Planet(rawValue: sender.tag) {
            selectedPlanet = tag
        }
        
        if mySpaceShip.travel(to: selectedPlanet ) {
            switch mySpaceShip.currentPlanet.rawValue {
            case 1, 3, 5, 6, 7:
                currentPlanet.text = sender.currentTitle
            case 4:
                currentPlanet.text = "Mars"
            default:
                currentPlanet.text = "Default"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
    }
    
    

    


}

