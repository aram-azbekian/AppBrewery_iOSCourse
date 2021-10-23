//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercentage: Float = 0.0
    var numberOfPeople: Int = 2
    var totalPerPerson: String = ""

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        let tip = sender.currentTitle?.dropLast() ?? "0"
        tipPercentage = Float(tip)! / 100
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = String(format: "%.0f", sender.value)
        splitNumberLabel.text = stepperValue
        numberOfPeople = Int(stepperValue)!
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal = Float(billTextField.text!)!
        let totalPP = (1 + tipPercentage) * billTotal / Float(numberOfPeople)
        totalPerPerson = String(format: "%.2f", totalPP)
        print(totalPerPerson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let vc = segue.destination as! ResultsViewController
            
            vc.numberOfPeople = numberOfPeople
            vc.tipPercentage = tipPercentage
            vc.totalPerPerson = totalPerPerson
        }
    }
}

