//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Gabriel Henrique Santos Pereira on 25/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var viewTimer: UIView!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet var collectionButtonsAnswer: [UIButton]!
    
    let quizManager = QuizManager()
    
    /** Method executed when the view appears at the first time and all components are loaded */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /** Method executed when our ViewController will appear to the user, reseting the time bar and generating a new quiz */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTimerBar()
        getNewQuiz()
    }
    
    /** Method that prepare the ResultViewController to receive data from QuizViewController */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectedAnswers
    }
    
    /**
     * Animate the timer bar on top of QuizViewController
     * By default, the time to answer the questions are 60 seconds
     * To animate the time bar, we change the width of our UIView with the orange color
     */
    func animateTimerBar() {
        /** Here we set that the viewTimer will have the same width of our device screen when the view appear */
        viewTimer.frame.size.width = view.frame.size.width
        
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viewTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
    }
    
    /**
     * Method to generate a new group of question for our quiz
     * After generating a new quiz, the method is responsible for setting up the title of the question and the answer buttons
     */
    func getNewQuiz() {
        quizManager.refreshQuiz()
        
        labelQuestion.text = quizManager.question
        
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = collectionButtonsAnswer[i]
            
            button.setTitle(option, for: .normal)
        }
    }
    
    /**
     * Method that performs our segue to the ResultsViewController
     * It's only called on callback closure from animate method of UIView component
     */
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }

    /**
     * Method associate to a collection of UIButtons, that select and validate the user answer
     * When the user click, we validate the selected answer and generate a new question inside the app
     */
    @IBAction func actionSelectAnswer(_ sender: UIButton) {
        let index = collectionButtonsAnswer.firstIndex(of: sender)!
        
        quizManager.validateAnswer(index: index)
        
        getNewQuiz()
    }
}
