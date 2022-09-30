import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var reversedLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    
    var reverseCondition: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButton.isEnabled = false
        reverseButton.setTitle("Reverse", for: .normal)
    }
    
    @IBAction func clickReverseButton(_ sender: Any) {
        if reverseCondition {
            reversedLabel.text = reverseString(originText: inputTextField.text ?? "")
            reverseButton.setTitle("Clear", for: .normal)
            inputTextField.isUserInteractionEnabled = false
            reverseCondition = false
        } else {
            inputTextField.text = ""
            reversedLabel.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
            reverseButton.isEnabled = false
            reverseCondition = true
            inputTextField.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func doneTyping(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func textOriginEditing(_ sender: Any) {
        reverseButton.isEnabled = inputTextField.text?.isEmpty == false
    }
    
    func reverseString(originText: String) -> String {
        let arrayOrigin = [String](originText.components(separatedBy: " "))
        var arrayOutput = [String]()
        for word in arrayOrigin {
            arrayOutput.append(String(word.reversed()))
        }
        return arrayOutput.joined(separator: " ")
    }
}

