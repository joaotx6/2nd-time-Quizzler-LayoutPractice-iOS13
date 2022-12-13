//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    //Array 2D
    let quiz = [
        ["5 + 3 its equal to 8", "True"],
        ["9 + 2 its equal to 7", "False"],
        ["3 + 1 its equal to 4",  "True"]
    ]
    
    //criaçao de variavel pra acompanhar a questao ou posiçao no array
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        //Controlar a resposta do user
        let userAnswer = sender.currentTitle
        
        //A 1a camada corresponde ao valor do questionNumber; E a 2a camada é sempre posição 1, k é onde reside a resposta true ou false
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Correct!")
        } else {
            print("Wrong!")
        }
        
        
        //controlar o erro, pra n entrar em out of range
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            print("Out of index, resetting")
            questionNumber = 0 //resetting the quiz questions to beggining
        }
        
        
//        if questionNumber == 2 {
//        questionNumber = questionNumber + 0
//    } else {
//        questionNumber += 1
//    }
        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[questionNumber][0]
        
    }
    
}

