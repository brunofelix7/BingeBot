import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showsLabel: UILabel!
    @IBOutlet weak var randomShowLabel: UILabel!
    @IBOutlet weak var spokenLabel: UILabel!
    @IBOutlet weak var addShowTextField: UITextField!
    @IBOutlet weak var addShowBtn: UIButton!
    @IBOutlet weak var randomShowStackView: UIStackView!
    @IBOutlet weak var addShowStackView: UIStackView!
    @IBOutlet weak var showsStackView: UIStackView!
    
    var shows: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsStackView.isHidden = true
        randomShowStackView.isHidden = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func addShowsBtnWasPressed(_ sender: UIButton) {
        guard let showName = addShowTextField.text else { return }
        shows.append(showName)
        updateShowsLabel()
        addShowTextField.text = ""
        showsStackView.isHidden = false
        
        if shows.count > 1 {
            randomShowStackView.isHidden = false
            spokenLabel.isHidden = true
            randomShowLabel.isHidden = true
        }
    }
    
    @IBAction func randomBingeShowBtnWasPressed(_ sender: UIButton) {
        randomShowLabel.text = shows.randomElement()
        randomShowLabel.isHidden = false
        spokenLabel.isHidden = false
    }
    
    func updateShowsLabel() {
        showsLabel.text = shows.joined(separator: ", ")
    }
}
