//
//  ViewController.swift
//  LegendsOfSwift
//
//  Created by Romain Francois on 25/07/2020.
//  Copyright © 2020 Romain Francois. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var fact = Fact()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = ""
    }
    
    func replaceName(quote: String) -> String {
        var newQuote = quote
        newQuote = newQuote.replacingOccurrences(of: "Chuck", with: firstNameField.text!)
        newQuote = newQuote.replacingOccurrences(of: "chuck", with: firstNameField.text!)
        
        newQuote = newQuote.replacingOccurrences(of: "Norris", with: lastNameField.text!)
        newQuote = newQuote.replacingOccurrences(of: "norris", with: lastNameField.text!)
        
        newQuote = newQuote.replacingOccurrences(of: " &quot", with: " \" ")
        
        return newQuote
    }
    
    func updateGender(quote: String) -> String {
        if genderSegmentedControl.selectedSegmentIndex == 1 {
            var newQuote = quote
            newQuote = newQuote.replacingOccurrences(of: " him", with: " her")
            newQuote = newQuote.replacingOccurrences(of: " he", with: " she ")
            newQuote = newQuote.replacingOccurrences(of: " (he", with: " (she ")
            newQuote = newQuote.replacingOccurrences(of: " He", with: " She")
            newQuote = newQuote.replacingOccurrences(of: " his", with: " her ")
            newQuote = newQuote.replacingOccurrences(of: " His", with: " Her ")
            newQuote = newQuote.replacingOccurrences(of: " beard", with: " hair ")
            
            return newQuote
        }
        
        return quote
    }

    @IBAction func getFactPressed(_ sender: UIButton) {
        fact.getData {
            DispatchQueue.main.async {
                self.outputLabel.text = self.updateGender(quote:             self.replaceName(quote: self.fact.value))
            }
        }
    }
    
}

