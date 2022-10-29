import UIKit


final class ReverseWordsViewController: UIViewController {

    @IBOutlet private weak var reversedLabel: UILabel!
    @IBOutlet private weak var reverseButton: UIButton!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var switchModeSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var defaultModeLabel: UILabel!
    @IBOutlet private weak var ignoredTextField: UITextField!
    
   
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
        switchModeSegmentedControl.accessibilityIdentifier = "switchMode"
        ignoredTextField.accessibilityIdentifier = "ignoredTextField"
        defaultModeLabel.isHidden = false
        ignoredTextField.isHidden = true
    }
    
    @IBAction func reverseButtonTapped() {
        if isReversed {
            inputTextField.text = ""
            reversedLabel.text = ""
            ignoredTextField.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
            reverseButton.isEnabled = false
            isReversed = false
        } else {
            reversedLabel.text = textReverseManager.reversedString(originText: inputTextField.text ?? "", ignoredCaracters: ignoredTextField.text ?? "")
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
    
    @IBAction func typingInIgnoredIsDone() {
        ignoredTextField.resignFirstResponder()
    }
    
    @IBAction func modeSwitched() {
        reversedLabel.text = ""
        if switchModeSegmentedControl.selectedSegmentIndex == 0 {
            defaultModeLabel.isHidden = false
            ignoredTextField.isHidden = true
            ignoredTextField.text = ""
        } else {
            defaultModeLabel.isHidden = true
            ignoredTextField.isHidden = false
        }
        inputTextChanged()
    }
    
    @IBAction func ignoredTextChanged() {
        inputTextChanged()
    }
    
}
 
