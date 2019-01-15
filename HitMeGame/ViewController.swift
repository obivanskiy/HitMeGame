//
//  ViewController.swift
//  HitMeGame
//
//  Created by Ivan Obodovskyi on 1/14/19.
//  Copyright © 2019 Ivan Obodovskyi. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var currentSliderValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var roundNumber = 1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var earnedScoresLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBAction func showAlert() {
        var difference = abs(targetValue - currentSliderValue)
        let pointsAmount = 100 - difference
        var currentResult = 0
        
        
        let title: String
        
        if difference == 0 {
            title = "Bulls eye!"
            currentResult += pointsAmount*2
        } else if difference <= 5 {
            title = "Very good!"
            currentResult += pointsAmount
        } else if difference <= 10{
            title = "It's ok, you can do better!"
            currentResult += pointsAmount
        } else {
            title = "I think you should check your vision!"
            currentResult += 50
        }
        score += currentResult
        
        let message = "You have hit \(currentSliderValue)"+"\nYou scored \(currentResult) points"
       
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //creates OK button
        let action = UIAlertAction(title: "Ok!", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        //Tells the view controller to add button to the alert controller
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        roundNumber += 1
        //updates score labels
        
    }
    
    @IBAction func restartTheGame() {
        currentSliderValue = 0
        slider.value = Float(currentSliderValue)
        score = 0
        earnedScoresLabel.text = String(score)
        roundNumber = 1
        roundLabel.text = String(roundNumber)
        targetValue = Int.random(in: 1...100)
        targetValueLabel.text = String(targetValue)
        
    }
    
    
    
    
    
    @IBAction func sliderValue(_ slider: UISlider) {
        //assigns the slider value to the global variable called currentSliderValue
        let roundedValueOfSlider = Int(slider.value.rounded())
        currentSliderValue = roundedValueOfSlider
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValueOfSlider = Int(slider.value.rounded())
        currentSliderValue = roundedValueOfSlider
        //Starts new round as the view pops up
        startNewRound()
        
    }
    
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentSliderValue = 0
        slider.value = Float(currentSliderValue)
        setTheTargetValue()
        
    }
    func setTheTargetValue() {
        targetValueLabel.text = String(targetValue)
        earnedScoresLabel.text = String(score)
        roundLabel.text = String(roundNumber)
        
    }
    


}

