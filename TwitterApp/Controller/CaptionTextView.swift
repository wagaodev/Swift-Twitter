
import UIKit

class CaptionTextView: UITextView {
  
// MARK: - Properties

  let placeholderLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 16)
    label.textColor = .darkGray
    return label
  }()







// MARK: - Lifecycle

  override init(frame: CGRect, textContainer: NSTextContainer?){
    super.init(frame: frame, textContainer: textContainer)
    
    backgroundColor = .red
    font = UIFont.systemFont(ofSize: 16)
    isScrollEnabled = false
    heightAnchor.constraint(equalToConstant: 300).isActive = true
    
    addSubview(placeholderLabel)
    placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 4)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  






// MARK: - API









// MARK: - Selectors









// MARK: - Helpers









}
