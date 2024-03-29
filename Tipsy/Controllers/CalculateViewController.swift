//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercent : Float = 0.1
    var splitNumber : Int = 2
    var bill : Float = 0.0
    var toReturn: String = ""

    @IBAction func tipChanged(_ sender: UIButton) {
        let pctSelected = sender.title(for: .normal)
        
        switch pctSelected{
        case "0%": 
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPercent = 0.0
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipPercent = 0.1
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipPercent = 0.2
        default:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipPercent = 0.1
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill = Float(billTextField.text!)!
        let tip = tipPercent * bill
        let totalPerPerson = Float(tip + bill) / Float(splitNumber)
        toReturn = String(format: "%.2f", totalPerPerson)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedResult = toReturn
            destinationVC.numberOfPeople = String(splitNumber)
            destinationVC.tipPercentage = String(tipPercent * 100)+"%"
        }
    }
}

