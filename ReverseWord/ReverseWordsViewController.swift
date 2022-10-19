import UIKit

final class ReverseWordsViewController: UIViewController {

    @IBOutlet private weak var reversedLabel: UILabel!
    @IBOutlet private weak var reverseButton: UIButton!
    @IBOutlet private weak var inputTextField: UITextField!
    
    var isReversed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButton.isEnabled = false
        reverseButton.setTitle("Reverse", for: .normal)
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = "Reverse words"
    }
    
    @IBAction func reverseButtonTapped() {
        if isReversed {
            print("rev - true")
            inputTextField.text = ""
            reversedLabel.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
            reverseButton.isEnabled = false
            isReversed = false
        } else {
            print("rev - false")
            reversedLabel.text = reversedString(originText: inputTextField.text ?? "")
            reverseButton.setTitle("Clear", for: .normal)
            isReversed = true
        }
    }
    
    @IBAction func inputTextChanged() {
        reverseButton.isEnabled = inputTextField.text?.isEmpty == false
        reverseButton.setTitle("Reverse", for: .normal)
        isReversed = false
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
