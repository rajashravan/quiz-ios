//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

// controller should only deal with UI interactions, and UI responses

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var brain: QuizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswerAsBool = (sender.titleLabel!.text! as NSString).boolValue
        let isCorrectAnswer = brain.markCurrentQuestion(userAnswer: userAnswerAsBool)
        if isCorrectAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let currentQuestion = brain.currentQuestion()
        questionLabel.text = currentQuestion.text
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        // update progress bar
        let progress = Float(brain.questionNumber + 1) / Float(brain.quiz.count)
        progressBar.progress = progress
    }
    
}

