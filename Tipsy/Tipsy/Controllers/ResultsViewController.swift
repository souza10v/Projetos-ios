import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billFinal = "0"
    var totalTip = 0.0
    var totalPeople = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = billFinal
        settingsLabel.text = "Split between \(totalPeople) a tips amount of \(Int(totalTip*100))%."
    }
    
    @IBAction func recalculatedPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
