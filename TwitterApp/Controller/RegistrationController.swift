import UIKit

class RegistrationController: UIViewController {
  
  // MARK - Properties
  
  private let logoImageView: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFit
    iv.clipsToBounds = true
    iv.image = #imageLiteral(resourceName: "plus_photo")
    
    return iv
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
  
  private lazy var fullNameContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
    let view = Utilities().inputContainerView(withImage: image, textField: fullNameTextField)
    
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
    
    view.addSubview(logoImageView)
    logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, )
    logoImageView.setDimensions(width: 150, height: 150)
    
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
    
    stack.axis = .vertical
    stack.spacing = 20
    stack.distribution = .fillEqually
    
    view.addSubview(stack)
    stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    
    
    
    
  }
  
  
}
