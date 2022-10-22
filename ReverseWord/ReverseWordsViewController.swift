import UIKit


final class ReverseWordsViewController: UIViewController {

    @IBOutlet private weak var reversedLabel: UILabel!
    @IBOutlet private weak var reverseButton: UIButton!
    @IBOutlet private weak var inputTextField: UITextField!
    
    var isReversed = false
    var textReverseManager = TextReverseManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButton.isEnabled = false
        reverseButton.setTitle("Reverse", for: .normal)
        self.navigationController?.navigationBar.isTranslucent = true
        self.title = "Reverse words"
        inputTextField.accessibilityIdentifier = "inputTextField"
        reversedLabel.accessibilityIdentifier = "reversedLabel"
        reverseButton.accessibilityIdentifier = "reverseButton"
    }
    
    @IBAction func reverseButtonTapped() {
        if isReversed {
            inputTextField.text = ""
            reversedLabel.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
            reverseButton.isEnabled = false
            isReversed = false
        } else {
            reversedLabel.text = textReverseManager.reversedString(originText: inputTextField.text ?? "")
            reverseButton.setTitle("Clear", for: .normal)
            isReversed = true
        }
    }
    
    @IBAction func inputTextChanged() {
        reverseButton.isEnabled = inputTextField.text?.isEmpty == false
        reverseButton.setTitle("Reverse", for: .normal)
        isReversed = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func typingIsDone() {
        inputTextField.resignFirstResponder()
    }
}
