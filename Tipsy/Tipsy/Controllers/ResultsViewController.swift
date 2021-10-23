//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Арам on 01.09.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPerson: String = "0.0"
    var numberOfPeople: Int = 2
    var tipPercentage: Float = 0.2

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tipString = String(format: "%.0f", tipPercentage * 100)
        totalLabel.text = totalPerPerson
        settingsLabel.text = String("Split between \(numberOfPeople) people, with \(tipString)% tip.")
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
