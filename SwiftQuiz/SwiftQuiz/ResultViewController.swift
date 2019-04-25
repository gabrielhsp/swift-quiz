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
        
        labelAnswered.text = "Perguntas respondidas: \(totalAnswers)"
        labelCorrect.text = "Perguntas corretas: \(totalCorrectAnswers)"
        labelWrong.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        
        let score = totalCorrectAnswers * 100 / totalAnswers
        
        labelScore.text = "\(score)%"
    }
    
    @IBAction func actionClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
