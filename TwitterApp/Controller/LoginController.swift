import UIKit

class LoginController: UIViewController {
  
  // MARK - Properties
  
  
  private lazy var emailContainerView: UIView = {
    let view = UIView()
    return view
  }()
  
  private lazy var passwordContainerView: UIView = {
    let view = UIView()
    return view
  }()
   
  // MARK - Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  
  // MARK - Selectors
  
  
  //MARK - Helpers
  func configureUI(){
    view.backgroundColor = .white
    logoInTop()
    

  }
  
  func logoInTop(){
    let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
    imageView.contentMode = .scaleAspectFit
    imageView.setDimensions(width: 40, height: 40)
    navigationItem.titleView = imageView
  }
  
}
