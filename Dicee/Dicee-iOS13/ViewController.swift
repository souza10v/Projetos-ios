import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var sumOutput: UILabel!
    
    var leftDiceNumber = 1
    var rigthDiceNumber = 5
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    let numsArray = [1,2,3,4,5,6]
    var n1 = 0
    var n2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        diceImageView1.image = diceArray[leftDiceNumber]
        diceImageView2.image = diceArray[rigthDiceNumber]
        
        n1 = numsArray[leftDiceNumber]
        n2 = numsArray[rigthDiceNumber]

        leftDiceNumber = Int.random(in: 0...5)
        rigthDiceNumber = Int.random(in: 0...5)
        
        sumOutput.text = String(n1 + n2)
    }
    
}

