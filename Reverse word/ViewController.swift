import UIKit

final class ReverseWordsViewController: UIViewController {

    @IBOutlet weak var reversedLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    
    var reverseCondition: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButton.isEnabled = false
        reverseButton.setTitle("Reverse", for: .normal)
    }
    
         
    @IBAction func clickReverseButton() {
        if reverseCondition {
            reversedLabel.text = reversedString(originText: inputTextField.text ?? "")
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
    
    @IBAction func typingText() {
        reverseButton.isEnabled = inputTextField.text?.isEmpty == false
    }
    
    func reversedString(originText: String) -> String {
        let arrayOrigin = [String](originText.components(separatedBy: " "))
        var arrayOutput = [String]()
        for word in arrayOrigin {
            arrayOutput.append(String(word.reversed()))
        }
        return arrayOutput.joined(separator: " ")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func typingIsDone() {
        inputTextField.resignFirstResponder()
    }
}

