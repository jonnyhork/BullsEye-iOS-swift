//
//  ViewController.swift
//  Bulls Eye Game
//
//  Created by Jonny Hork on 10/24/17.
//  Copyright © 2017 G62-Jonny Hork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue: Int = 0
    @IBOutlet weak var targetLabel: UILabel!
    var score: Int = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
    
    let difference:Int = abs(currentValue - targetValue)
    let points = 100 - difference
    
    score += points
    
    let message = "The difference is: \(difference)" +
        "\nYou scored \(points) points"
    
    let alert = UIAlertController(title: "Slider Value", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Play Again", style: .default, handler: nil)
    
        alert.addAction(action)
    
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }


}

