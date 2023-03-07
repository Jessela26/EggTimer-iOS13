//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes : [String: Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var secondsRemaining = 60
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        let boilTime = eggTimes[hardness]!
        
        print("To achieve \(hardness) boiled egg, you must boil it for \(boilTime) seconds.")
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,                                          selector: #selector(oneSecond(sender:)), userInfo: nil, repeats: true)
    }
    
    @IBOutlet weak var eggPrompt: UILabel!
    @objc func oneSecond(sender: Timer) {
        if secondsRemaining > 0{
            print("\(secondsRemaining) seconds left.")
            secondsRemaining -= 1
        }
        else {
            print("Timer ended!")
            eggPrompt.text = "DONE!"
            timer.invalidate()
        }
        
    }
}
