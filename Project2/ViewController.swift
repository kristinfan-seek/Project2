//
//  ViewController.swift
//  Project2
//
//  Created by Kristin Fan on 29/3/2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfPlay = 0
    var listedCountries = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        listedCountries = countries
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        let country = countries[correctAnswer].uppercased()
        title = "\(country) (Score:\(score))"
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = ""
            score += 1
        } else {
            title = "Wrong"
            message = "Wrong! That’s the flag of \(listedCountries[sender.tag].uppercased())"
            score -= 1
        }
        numberOfPlay += 1
        message += "\nYour \(numberOfPlay == 10 ? "final" : "") score is \(score)"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if (numberOfPlay < 10) {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
        }
        
        present(ac, animated: true)
    }
}
