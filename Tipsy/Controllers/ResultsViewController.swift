//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Serena  on 1/19/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculatedResult: String = "0.0"
    var numberOfPeople: String = "0"
    var tipPercentage: String = "0%"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = calculatedResult
        settingsLabel.text = "Split between "+numberOfPeople+" people, with "+tipPercentage+" tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
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
