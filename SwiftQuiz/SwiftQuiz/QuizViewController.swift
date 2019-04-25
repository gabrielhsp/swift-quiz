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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /** Here we set that the viewTimer will have the same width of our device screen when the view appear */
        viewTimer.frame.size.width = view.frame.size.width
        
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viewTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        getNewQuiz()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectedAnswers
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        
        labelQuestion.text = quizManager.question
        
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = collectionButtonsAnswer[i]
            
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }

    @IBAction func actionSelectAnswer(_ sender: UIButton) {
        let index = collectionButtonsAnswer.firstIndex(of: sender)!
        
        quizManager.validateAnswer(index: index)
        
        getNewQuiz()
    }
}
