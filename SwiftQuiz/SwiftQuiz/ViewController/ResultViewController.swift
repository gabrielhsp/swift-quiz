//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Gabriel Henrique Santos Pereira on 25/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var labelAnswered: UILabel!
    @IBOutlet weak var labelCorrect: UILabel!
    @IBOutlet weak var labelWrong: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setQuizResults()
    }
    
    /**
     * Method to add results inside each label of ResultViewController
     * The values are passed by segue of QuizViewController to ResultViewController
     */
    func setQuizResults() {
        let score = totalCorrectAnswers * 100 / totalAnswers
        
        labelAnswered.text = "Perguntas respondidas: \(totalAnswers)"
        labelCorrect.text = "Perguntas corretas: \(totalCorrectAnswers)"
        labelWrong.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        labelScore.text = "\(score)%"
    }
    
    /** Close the ResultsViewController and redirect the user to QuizViewControlelr again */
    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
