import UIKit

class ViewController: UIViewController {
    let eggTimes = ["soft": 3, "medium": 4, "hard": 7]
    var startTimer = 0
    var timer = Timer()
    
    @IBOutlet weak var eggTimer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eggTimer.text = "CHOOSE YOU LIKE EGGS"
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        if sender.currentTitle != nil && eggTimes["\(String(sender.currentTitle!))"] != nil {
            let senderCurrentTittle = sender.currentTitle!
            switch sender.currentTitle {
            case "soft":
                startTimer = eggTimes[senderCurrentTittle]!
            case "medium":
                startTimer = eggTimes[senderCurrentTittle]!
            case "hard":
                startTimer = eggTimes[senderCurrentTittle]!
            default: break
            }
        } else {
            eggTimer.text = "error"
        }
    }
    
    @objc func updateCounter() {
        if startTimer > 0 && startTimer % 60 < 10 {
            eggTimer.text = "\(startTimer / 60):0\(startTimer % 60)"
        } else  if startTimer > 0 && startTimer % 60 >= 10 {
            eggTimer.text = "\(startTimer / 60):\(startTimer % 60)"
        } else {
            eggTimer.text = "YOUR EGG IS COOKED"
        }
        startTimer -= 1
    }
}

