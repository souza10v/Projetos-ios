import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var people = 2
    var billTotal = 0.0
    var bill = "0"
    var finalResult = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true) //sumir o telcado antes de digitar
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100

    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        people = Int(sender.value)
    }
    
    
    @IBAction func calculatedPressed(_ sender: UIButton) {
        
        bill = (billTextField.text)!
        if bill != ""
        {
            billTotal = Double(bill)! * (tip + 1)
            let result = billTotal / Double(people)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
            performSegue(withIdentifier: "showResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billFinal = finalResult
            destinationVC.totalPeople = people
            destinationVC.totalTip = tip
        }
    }
    
}

