//
//  ViewController.swift
//  RPS
//
//  Created by Balmes Pavlov on 11/19/18.
//  Copyright © 2018 Balmes Pavlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logo: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var playButton: UIButton!
    
    var gameState: GameState = .start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }
    
    @IBAction func playerSignPressed(_ sender: UIButton) {
        print(sender.tag)
        switch sender.tag {
        case 1:
            button1.isEnabled = false
            button2.isEnabled = true
            button3.isEnabled = true
        case 2:
            button1.isEnabled = true
            button2.isEnabled = false
            button3.isEnabled = true
        case 3:
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = false
        default:
            break
        }
        
        let opponent: Sign = randomSign()
        
        if !button1.isEnabled {
            logo.text = opponent.emoji
            let playerSign: Sign = .rock
            button2.setTitle(playerSign.emoji, for: UIControl.State.normal)
            gameState = playerSign.compareSignTo(opponent)
        } else if !button2.isEnabled {
            logo.text = opponent.emoji
            let playerSign: Sign = .paper
            button2.setTitle(playerSign.emoji, for: UIControl.State.normal)
            gameState = playerSign.compareSignTo(opponent)
        } else if !button3.isEnabled {
            logo.text = opponent.emoji
            let playerSign: Sign = .scissors
            button2.setTitle(playerSign.emoji, for: UIControl.State.normal)
            gameState = playerSign.compareSignTo(opponent)
        }
        
        updateUI()
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        gameState = .start
        updateUI()
    }
    
    func updateUI() {
        switch gameState {
        case .start:
            self.view.backgroundColor = UIColor(red: 178/255, green: 176/255, blue: 155/255, alpha: 1.0)
            logo.text = "🤖"
            logo.numberOfLines = 0
            logo.font = UIFont.boldSystemFont(ofSize: 70.0)
            
            textLabel.text = "Rock, Paper, Scissors?"
            textLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
            
            button1.isEnabled = true
            button1.setTitle(Sign.rock.emoji, for: UIControl.State.normal)
            button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70.0)
            button1.tag = Sign.rock.rawValue
            button1.isHidden = false

            button2.isEnabled = true
            button2.setTitle(Sign.paper.emoji, for: UIControl.State.normal)
            button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70.0)
            button2.tag = Sign.paper.rawValue
            button2.isHidden = false
            
            button3.isEnabled = true
            button3.setTitle(Sign.scissors.emoji, for: UIControl.State.normal)
            button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 70.0)
            button3.tag = Sign.scissors.rawValue
            button3.isHidden = false
            
            playButton.setTitle("Play Again?", for: UIControl.State.normal)
            playButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
            playButton.isHidden = true
        case .win:
            self.view.backgroundColor = UIColor(red: 67/255, green: 170/255, blue: 139/255, alpha: 1.0)
            textLabel.text = "You Win!"
            
            button1.isHidden = true
            button2.isEnabled = false
            button3.isHidden = true
            
            playButton.setTitle("Play Again?", for: UIControl.State.normal)
            playButton.isHidden = false
        case .lose:
            self.view.backgroundColor = UIColor(red: 219/255, green: 80/255, blue: 74/255, alpha: 1.0)
            textLabel.text = "You Lose!"
            
            button1.isHidden = true
            button3.isHidden = true
            
            playButton.setTitle("Play Again?", for: UIControl.State.normal)
            playButton.isHidden = false
        case .draw:
            self.view.backgroundColor = UIColor(red: 178/255, green: 176/255, blue: 155/255, alpha: 1.0)
            textLabel.text = "Tie!"
            
            button1.isHidden = true
            button3.isHidden = true
            
            playButton.setTitle("Play Again?", for: UIControl.State.normal)
            playButton.isHidden = false
        }
    }
}

