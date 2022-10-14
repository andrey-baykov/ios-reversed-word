import UIKit

final class ReverseWordsViewController: UIViewController {

    @IBOutlet weak var reversedLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    
    var isRevererseAction = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.isTranslucent = true
        reverseButton.isEnabled = false
        reverseButton.setTitle("Reverse", for: .normal)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.title = "Yoooohooo"
        
    }
    
         
    @IBAction func clickReverseButton() {
        if isRevererseAction {
            reversedLabel.text = reversedString(originText: inputTextField.text ?? "")
            reverseButton.setTitle("Clear", for: .normal)
            isRevererseAction = false
        } else {
            inputTextField.text = ""
            reversedLabel.text = ""
            reverseButton.setTitle("Reverse", for: .normal)
            reverseButton.isEnabled = false
            isRevererseAction = true
        }
    }
    
    @IBAction func typingText() {
        reverseButton.isEnabled = inputTextField.text?.isEmpty == false
        reverseButton.setTitle("Reverse", for: .normal)
        isRevererseAction = true
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

