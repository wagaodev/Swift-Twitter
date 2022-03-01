import UIKit

class LoginController: UIViewController {
  
  // MARK - Properties
  
  private let logoImageView: UIImageView = {
    let logo = UIImageView()
    logo.contentMode = .scaleAspectFit
    logo.clipsToBounds = true
    logo.image = #imageLiteral(resourceName: "TwitterLogo")
    
    return logo
  }()
  
  private lazy var emailContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
    
    let view = Utilities().inputContainerView(withImage: image, textField: emailTextField)
    
    return view
  }()
  
  private lazy var passwordContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
    
    let view = Utilities().inputContainerView(withImage: image, textField: passwordTextField)

    return view
  }()

  
  private let emailTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Email")
    return tf
  }()
  
  private let passwordTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Password")
    tf.isSecureTextEntry = true
    return tf
  }()
  
  
  // MARK - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  
  // MARK - Selectors
  
  
  //MARK - Helpers
  func configureUI(){
    view.backgroundColor = .twitterBlue
    navigationController?.navigationBar.tintColor = .black
    navigationController?.navigationBar.isHidden = false
    
    view.addSubview(logoImageView)
    logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
    logoImageView.setDimensions(width: 150, height: 150)
    
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
   
    stack.axis = .vertical
    stack.spacing = 0
    
    view.addSubview(stack)
    stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 16, paddingRight: 32)
    

  }
  
}
