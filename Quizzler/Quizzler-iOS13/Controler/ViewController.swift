import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    

    @IBOutlet weak var a1Button: UIButton!
    @IBOutlet weak var a2Button: UIButton!
    @IBOutlet weak var a3Butoon: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
    
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    
    @objc func updateUI()
    {
        let answerChoices = quizBrain.getAnswer()
        a1Button.setTitle(answerChoices[0], for: .normal)
        a2Button.setTitle(answerChoices[1], for: .normal)
        a3Butoon.setTitle(answerChoices[2], for: .normal)
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore()) em \(quizBrain.getQuestionNumber())"
        a1Button.backgroundColor = UIColor.clear
        a2Button.backgroundColor = UIColor.clear
        a3Butoon.backgroundColor = UIColor.clear
    }

}

