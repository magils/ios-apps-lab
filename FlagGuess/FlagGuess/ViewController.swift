//
//  ViewController.swift
//  FlagGuess
//
//  Created by Moises Gil on 3/23/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var resetGameButton: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    
    let flagController = FlagController()
    var optionButtons: [UIButton?] = []
    var playedFlags : [String] = []
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionButtons = [option1Button, option2Button, option3Button]
        play()
    }
    
    func showAnswerIndicator(isCorrect: Bool) {
        if isCorrect {
            self.points += 10
            self.pointsLabel.text = "\(self.points)"
            self.title = "✅ Correct!"
        } else {
            self.title = "❌ Incorrect!"
        }
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.title = "Guess the flag"
        }
        
        play()
    }
    
    func resetGame() {
        points = 0
        pointsLabel.text = "\(points)"
        playedFlags = []
        play()
    }
    
    func play() {
        if let flagName = flagController.generateQuestion(
            optionButtons: optionButtons,
            excludeFlags: playedFlags,
            correctCallback: {self.showAnswerIndicator(isCorrect: true)},
            wrongCallback: {self.showAnswerIndicator(isCorrect: false)}
        ){
            flagImage.image = UIImage(named: flagName)
            playedFlags.append(flagName)
        } else {
            let alertMessage = "Score: \(points) points" + (points == 120 ?  "\n⭐️ PERFECT! ⭐️" : "")
            let alertView = UIAlertController(
                title: "Game Over!",
                message: alertMessage,
                preferredStyle: .alert
            )
            let playAgainAction = UIAlertAction(title:"Play again", style: .default) {
                _ in self.resetGame()
            }
            alertView.addAction(playAgainAction)
            self.present(alertView, animated: true)
        }
        
    }
    
    func showResetConfirmationAlert(from viewController: UIViewController) {
        let alertViewController = UIAlertController(
            title: "Reset Game",
            message: "Are you sure you want to reset the game?",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "Reset", style: .destructive) {
            _ in self.resetGame()
        }
        
        alertViewController.addAction(cancelAction)
        alertViewController.addAction(confirmAction)
        
        viewController.present(alertViewController, animated: true)
    }

    @IBAction func askResetConfirmation(_ sender: UIButton) {
        showResetConfirmationAlert(from: self)
    }
    
}

