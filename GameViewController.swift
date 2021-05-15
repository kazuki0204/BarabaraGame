//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by 丸井一輝 on 2021/05/12.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    var timer: Timer!
    var score: Int = 1000
    let defaults: UserDefaults = UserDefaults.standard
    
    let height: CGFloat = UIScreen.main.bounds.size.height
    
    var positionY: [CGFloat] = [0.0, 0.0, 0.0]
    
    var dy: [CGFloat] = [6.0, 3.0, -3.0]
    
    func start(){
        
        resultLabel.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self,
                                     selector: #selector(self.up), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func up(){
        for i in 0..<3{
            
            if positionY[i] > height || positionY[i] < 0{
                dy[i] = dy[i] * (-1)
            }
            positionY[i] += dy[i]
        }
        imgView1.center.y = positionY[0]
        imgView2.center.y = positionY[1]
        imgView3.center.y = positionY[2]
        
    }
    
    @IBAction func stop(){
        if timer.isValid == true{
            timer.invalidate()
        }
        
        for i in 0..<3{
            score = score - abs(Int(height/2 - positionY[i]))*2
        }
        resultLabel.text = "Score : " + String(score)
        resultLabel.isHidden = false
        
        let highScore1: Int = defaults.integer(forKey: "score1")
        let highScore2: Int = defaults.integer(forKey: "score2")
        let highScore3: Int = defaults.integer(forKey: "score3")
        
        if score > highScore1{
            defaults.set(score, forKey: "score1")
            defaults.set(highScore1, forKey: "score2")
            defaults.set(highScore2, forKey: "score3")
        } else if score > highScore2{
            defaults.set(score, forKey: "score2")
            defaults.set(highScore2, forKey: "score3")
        }else if score > highScore3{
            defaults.set(score, forKey: "score3")
        }
        defaults.synchronize()
    }
    
    @IBAction func retry(){
        score = 1000
        positionY = [height/2, height/2, height/2]
        if timer.isValid == false{
            self.start()
        }
    }
    
    @IBAction func top(){
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        positionY = [height/2, height/2, height/2]
        self.start()

        // Do any additional setup after loading the view.
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
