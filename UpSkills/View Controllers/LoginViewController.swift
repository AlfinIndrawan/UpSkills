import UIKit
import FirebaseAuth
import Combine

class LoginViewController: UIViewController {
  
  enum LoginStatus {
    case signUp
    case signIn
  }

  @IBOutlet var loginCard: CustomView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var primaryBtn: UIButton!
  @IBOutlet var accessoryBtn: UIButton!
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  
  var emailIsEmpty = true
  var passwordIsEmpty = true
  var loginStatus: LoginStatus = .signUp {
    didSet {
      self.titleLabel.text = (loginStatus == .signUp) ? "Sign up" : "Sign in"
      self.primaryBtn.setTitle((loginStatus == .signUp) ? "Sign up" : "Sign in", for: .normal)
      self.accessoryBtn.setTitle((loginStatus == .signUp) ? "Don't have account?" : "Already have account?", for: .normal)
      self.passwordTextField.textContentType = (loginStatus == .signUp) ? .newPassword : .password
  }
  }
  private var tokens: Set <AnyCancellable> = []
  
  override func viewDidLoad() {
        super.viewDidLoad()
    UIView.animate(withDuration: 1.0, delay: 0.75, options: .curveEaseInOut) {
      self.loginCard.alpha = 1
      self.loginCard.frame = self.loginCard.frame.offsetBy(dx: 0, dy: -400)
      }
    //creating a new publisher for emailtextfield (any time there is change in emailtextfield we can update the variable async)
    // use combine to listen changes inside text field
    emailTextField.publisher(for: \.text).sink { newValue in self.emailIsEmpty = (newValue == "" || newValue == nil)
    }.store(in: &tokens)
    passwordTextField.publisher(for: \.text).sink { newValue in self.passwordIsEmpty = (newValue == "" || newValue == nil)
    }.store(in: &tokens)
    
    }
  @IBAction func primaryBtnAction(_ sender: Any) {
    if emailIsEmpty || passwordIsEmpty {
      let alert = UIAlertController(title: "Missing Information", message: "Please make sure to enter a valid email password", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alert, animated: true, completion: nil)
    } else {
      if loginStatus == .signUp {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
          authResult, error in
          guard error == nil else {
            print( error!.localizedDescription)
            return
          }
          // if success segue to home screen
          self.goHome()
        }
      } else {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) {
          authResult, error in
          guard error == nil else {
            print(error!.localizedDescription)
            return
          }
          // if success segue to home screen
          self.goHome()
        }
      }
    }
  }
  
  @IBAction func accessoryBtnAction(_ sender: Any) {
    // if self login status is equal signup i wanto equal sign otherwise i wanto equal signup (ternary)
    
    self.loginStatus = (self.loginStatus == .signUp) ? .signIn: .signUp
  }
  
  func goHome() {
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarViewController") as! CustomTabBarViewController
    vc.modalTransitionStyle = .crossDissolve
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
}
