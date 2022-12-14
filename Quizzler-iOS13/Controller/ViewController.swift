//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!

    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
 
        //Verificar/controlar a resposta do utilizador
        let userAnswer = sender.currentTitle!
    
        //na função checkAnswer, o parametro externo é _, por isso n preciso usá-lo aki.
        //Fica mais curto o código
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //pedir próxima questão
        quizBrain.nextQuestion()
        
        /*
         alterar a cor do botão durante 2s. Nao precisa de estar alojado em uma variavel pk nc repete,
        por isso n é preciso invalidar. So ocorre 1x
        */
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        
        let answerChoices = quizBrain.getAnswers()
        answer1.setTitle(answerChoices[0], for: .normal)
        answer2.setTitle(answerChoices[1], for: .normal)
        answer3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        answer1.backgroundColor = UIColor.clear
        answer2.backgroundColor = UIColor.clear
        answer3.backgroundColor = UIColor.clear
    
    }
}
