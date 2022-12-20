//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Joao Teixeira on 18/12/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    //Evitamos a dificuldade de interpretação de um array 2D, assim usamos um
    //objeto (question) com texto e resposta; Ficando mais facil de interpretar.
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye§ in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
        
    ]
    /* exemplo array 2D (array dentro de um array)
     let quiz = [
     ["four + five its equal to seven", "False"]
     ]
     */
    
    //criaçao de variavel pra acompanhar a questao ou posiçao no array
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].rightAnswer {
            //controlar o score
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getProgress() -> Float {
        
        //aumentar a progressBar de acordo com o avanço no quiz.
        let progress = Float(quiz.count) / Float(questionNumber)
        return progress
    }
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answer
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //metódo marcado como mutating, o Self comporta-se como se fosse var e podemos alterar klkr propriedade da estrutura.
    mutating func nextQuestion() {
        
        //Controlling the Quiz progression: controlar o erro, pra n entrar em out of range
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            print("Out of index, resetting")
            questionNumber = 0 //resetting the quiz questions and score to beggining
            score = 0
        }
    }
    
    //Criar metodo pra aumentar score
    func getScore() -> Int {
        return score
    }
}
