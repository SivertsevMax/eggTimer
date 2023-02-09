import UIKit

class ViewController: UIViewController {
    let eggTimes = ["soft": 300, "medium": 10, "hard": 3]
    var startTimer = 0
    var startTimerProgress: Float = 0
    var timer = Timer()
    
    @IBOutlet weak var eggCookingProgress: UIProgressView!
    @IBOutlet weak var notificationAboutFinish: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eggCookingProgress.progress = 0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        if sender.currentTitle != nil && eggTimes["\(String(sender.currentTitle!))"] != nil {
            let senderCurrentTittle = sender.currentTitle!
            startTimer = eggTimes[senderCurrentTittle]!
            startTimerProgress = Float(eggTimes[senderCurrentTittle]!)
        }
    }
    
    @objc func updateCounter() {
        if startTimer > 0 && startTimer % 60 < 10 {
            notificationAboutFinish.text = "\(startTimer / 60):0\(startTimer % 60)"
        } else  if startTimer > 0 && startTimer % 60 >= 10 {
            notificationAboutFinish.text = "\(startTimer / 60):\(startTimer % 60)"
        } else {
            notificationAboutFinish.text = "YOUR EGG IS COOKED"
            timer.invalidate()
        }
        eggCookingProgress.progress = (Float(startTimer) / startTimerProgress)
        startTimer -= 1
    }
}

