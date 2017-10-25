//
//  ViewController.swift
//  Bulls Eye Game
//
//  Created by Jonny Hork on 10/24/17.
//  Copyright © 2017 G62-Jonny Hork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    @IBOutlet weak var targetLabel: UILabel!
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    
    @IBAction func startOver() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound(){
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
    
    let difference = abs(currentValue - targetValue)
    var points = 100 - difference
    
     
    let title: String
        if (difference == 0){
            title = "Perfect!"
            points += 100
        } else if (difference < 5){
            title = "So Close!"
            if(difference == 1){
                points += 50
            }
        } else if (difference < 10){
            title = "Pretty good"
        } else {
            title = "Not even close!"
        }
    
        score += points
    
    let message = "The difference is: \(difference)" +
        "\nYou scored \(points) points"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Play Again", style: .default, handler: {
            action in // This is called the closure, so the score only updates when the alert button is clicked
            self.startNewRound()
        })
    
        alert.addAction(action)
    
        present(alert, animated: true, completion: nil)
        
    }
    
    
    


}

