//
//  ViewController.swift
//  Reverse word first app
//
//  Created by Andrey Baykov on 9/28/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textOrigin: UITextField!
    
    @IBOutlet weak var resultText: UILabel!
    
    @IBOutlet weak var reverseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButton.isEnabled = false
        reverseButton.setTitle("Reverse", for: .normal)
        
    }
    
    @IBAction func clickReverseButton(_ sender: Any) {
        if (reverseButton.title(for: .normal) == "Reverse"){
            let arrayOrigin = [String]( textOrigin.text!.components(separatedBy: " "))
            var arrayOutput = [String]()
            
            for word in arrayOrigin{
                arrayOutput.append(String(word.reversed()))
            }
            resultText.text = arrayOutput.joined(separator: " ")
            reverseButton.setTitle("Clear", for: .normal)
        }
        else {
            textOrigin.text = ""
            resultText.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
            reverseButton.isEnabled = false
        }
        
    }
    
    @IBAction func doneTyping(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textOriginEditing(_ sender: Any) {
        if (textOrigin.text == "") {
            reverseButton.isEnabled = false
        }
        else {
            reverseButton.isEnabled = true
        }
    }
}

