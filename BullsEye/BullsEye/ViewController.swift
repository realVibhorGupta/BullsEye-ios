//
//  ViewController.swift
//  BullsEye
//
//  Created by Vibhor Gupta on 8/11/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelValue: UILabel!

    @IBOutlet weak var numberOfRounds: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var slider: UISlider!
    var currentValue  = 0
    var targetValue = 0
    var points : Int = 0
    var round = 0
    var score = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        labelValue.text = String(targetValue)



        startNewGame()


        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)


        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named : "SliderTrackLeft")
        let trackResizableImageLeft = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackResizableImageLeft, for: .normal)


        let trackRightImage = UIImage(named : "SliderTrackRight")
        let trackResizableImageRight = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackResizableImageRight, for: .normal)




    }

    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }

    @IBAction func startOverButton(_ sender: UIButton) {

      startNewGame()


    }


    @IBAction func showAlert(_ sender: UIButton) {

        let difference   : Int = abs(targetValue - currentValue)



        let title  : String

        if difference == 0 {
            title = "Awesome!!Its a PERFAAACT Score"
            points += 100
        }else if difference < 5 {
            title = "You were pretty close"

            points += 50
        }else if  difference  < 10 {
            title = "Still close"
            points += 25
        }
        else {

            title = " Not Even CloSe Try again"
            points += 0
        }
        score += points
        let message = "You scored \(points)"
        let alert = UIAlertController(title: "Bull's Eye", message: message, preferredStyle: .alert)
        let action  = UIAlertAction(title: title, style: .default, handler: {
            action in
            self.startNewRound()
        }
        )


        alert.addAction(action)

        present(alert, animated: true, completion: nil)
       

    }


    func startNewRound(){
        round = round + 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        labelValue.text = String(targetValue)
        totalScore.text  = String(score)

        numberOfRounds.text = String(round)
    }

    @IBAction func SliderMoved(_ sender: UISlider) {
        print("the  value of the slider is now:\(sender.value)")

        currentValue = Int(sender.value)

        
    }


}

