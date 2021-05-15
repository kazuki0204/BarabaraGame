//
//  RankingViewController.swift
//  BarabaraGame
//
//  Created by 丸井一輝 on 2021/05/12.
//

import UIKit

class RankingViewController: UIViewController {
        
    @IBOutlet var rankingLabel1: UILabel!
    @IBOutlet var rankingLabel2: UILabel!
    @IBOutlet var rankingLabel3: UILabel!
        
    let defaults: UserDefaults = UserDefaults.standard
    
    @IBAction func toTop(){
        self.dismiss(animated: true, completion: nil)
    }


    override func viewDidLoad() {
        rankingLabel1.text = String(defaults.integer(forKey: "score1"))
        rankingLabel2.text = String(defaults.integer(forKey: "score2"))
        rankingLabel3.text = String(defaults.integer(forKey: "score3"))
        super.viewDidLoad()

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
