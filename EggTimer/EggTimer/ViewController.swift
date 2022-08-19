import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]

    var timer = Timer()
    var totalTime = 0
    var secondPass = 0
    
    @IBAction func hardenssEgg(_ sender: UIButton) {
        
        timer.invalidate()
        progressView.progress = 0
        secondPass = 0
        titleLabel.text = "How do you like your eggs?"
        
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    
    @objc func updateTimer(){
        if secondPass < totalTime {
            let percetangeProgress = Float(secondPass)/Float(totalTime)
            //print(percetangeProgress)
            progressView.progress = Float(percetangeProgress)
            secondPass += 1
            
        } else {
            titleLabel.text = "Done!"
            progressView.progress = 1.0
            playSound(soundName: "alarm_sound")
        }
        
        
    func playSound(soundName : String) {
            let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
                    
        }
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Not found")
//
//        }
        
//        if(sender.currentTitle == "Soft"){
//            print(softTime)
//        } else if (sender.currentTitle == "Medium") {
//            print(mediumTime)
//        } else{
//            print(hardTime)
//        }

        
    
    }
    

}
