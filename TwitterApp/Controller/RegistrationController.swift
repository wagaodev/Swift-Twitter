import UIKit

class RegistrationController: UIViewController {
  
  // MARK - Properties
  
  private let plusPhotoButton: UIButton  = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "plus_photo"), for: .normal)
    button.tintColor = .white
    button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
    
    return button
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
  
  private lazy var passwordConfirmContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
    let view = Utilities().inputContainerView(withImage: image, textField: passwordConfirmTextField)
    
    return view
  }()
  
  private lazy var fullNameContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
    let view = Utilities().inputContainerView(withImage: image, textField: fullNameTextField)

    return view
  }()
  
  private lazy var usernameContainerView: UIView = {
    let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
    let view = Utilities().inputContainerView(withImage: image, textField: usernameTextField)
    
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
 
  private let passwordConfirmTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Password Confirmation")
    tf.isSecureTextEntry = true
    
    return tf
  }()
  
  private let fullNameTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Full Name")
    
    return tf
  }()
  
  private let usernameTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Username")
    
    return tf
  }()
  
  private let SignUpButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.setTitleColor(.twitterBlue, for: .normal)
    button.backgroundColor = .white
    button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    button.layer.cornerRadius = 8
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
    
    return button
  }()
  
  private let alreadyHaveAccountButton: UIButton = {
    let button = Utilities().atttributedButton("Already have an account ? ", "Log In")
    button.addTarget(self, action: #selector(handleNavigateToLogin), for: .touchUpInside)
    
    return button
  }()
  
  // MARK - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  // MARK - Selectors
  
  @objc func handleAddProfilePhoto(){
    print("Fotão")
  }
  
  @objc func handleRegistration(){
    print("Esse botão fará login")
  }
  
  @objc func handleNavigateToLogin(){
    navigationController?.popViewController(animated: true)
  }
  
  
  //MARK - Helpers
  func configureUI(){
    view.backgroundColor = .twitterBlue
    navigationController?.navigationBar.tintColor = .white
    
    view.addSubview(plusPhotoButton)
    plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
    plusPhotoButton.setDimensions(width: 150, height: 150)
    
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView,
                                                  passwordConfirmContainerView, fullNameContainerView,
                                                  usernameContainerView, SignUpButton, alreadyHaveAccountButton])
    
    stack.axis = .vertical
    stack.spacing = 20
    stack.distribution = .fillEqually
    
    view.addSubview(stack)
    stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    
    view.addSubview(alreadyHaveAccountButton)
    alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                    right: view.rightAnchor, paddingLeft: 40, paddingBottom: 16, paddingRight: 40)
    
    
  }
  
  
}
