import UIKit
import Firebase

class RegistrationController: UIViewController {
  
  // MARK - Properties
  
  private let plusPhotoButton: UIButton  = {
    let button = UIButton(type: .system)
    button.setImage(UIImage(named: "plus_photo"), for: .normal)
    button.tintColor = .white
    button.addTarget(self, action: #selector(handleAddProfilePhoto), for: .touchUpInside)
    
    return button
  }()
  
  private let imagePicker = UIImagePickerController()
  private var profileImage: UIImage?
  
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
  
  private let fullNameTextField: UITextField = {
    let tf = Utilities().textField(withPlaceholder: "Full Name")
    tf.autocapitalizationType = .words
    
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
    present(imagePicker, animated: true, completion: nil)
  }
  
  @objc func handleRegistration(){
    guard let profileImage = profileImage else {
      print("DEBUG: Please select a profile image...")
      return
    } 
    
    guard let email = emailTextField.text else { return }
    guard let password = passwordTextField.text else { return }
    guard let fullname = fullNameTextField.text else { return }
    guard let username = usernameTextField.text else { return }
    
    let credentials = AuthCredentials(email: email,
                                      password: password,
                                      fullname: fullname,
                                      username: username,
                                      profileImage: profileImage)
    
    AuthService.shared.registerUser(credentials: credentials) { (error, ref) in
      print("DEBUG: Sign Up successful...")
      print("DEBUG: Handle update user interface here...")
    }
  }
  
  
  
  @objc func handleNavigateToLogin(){
    navigationController?.popViewController(animated: true)
  }
  
  
  //MARK - Helpers
  func configureUI(){
    
    imagePicker.delegate = self
    imagePicker.allowsEditing = true
    
    
    view.backgroundColor = .twitterBlue
    navigationController?.navigationBar.tintColor = .white
    
    view.addSubview(plusPhotoButton)
    plusPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
    plusPhotoButton.setDimensions(width: 128, height: 128)
    
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView,
                                               fullNameContainerView,
                                               usernameContainerView, SignUpButton, alreadyHaveAccountButton])
    
    stack.axis = .vertical
    stack.spacing = 20
    stack.distribution = .fillEqually
    
    view.addSubview(stack)
    stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                 paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    
    view.addSubview(alreadyHaveAccountButton)
    alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                    right: view.rightAnchor, paddingLeft: 40, paddingBottom: 16, paddingRight: 40)
  }
}

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
                             info: [UIImagePickerController.InfoKey: Any]) {
    guard let profileImage = info[.editedImage] as? UIImage else { return }
    self.profileImage = profileImage
    
    plusPhotoButton.layer.cornerRadius = 128 / 2
    plusPhotoButton.layer.masksToBounds = true
    plusPhotoButton.imageView?.contentMode = .scaleAspectFit
    plusPhotoButton.imageView?.clipsToBounds = true
    plusPhotoButton.layer.borderWidth = 2
    plusPhotoButton.layer.borderColor = UIColor.white.cgColor
    
    self.plusPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
    
    dismiss(animated: true, completion: nil)
  }
}
