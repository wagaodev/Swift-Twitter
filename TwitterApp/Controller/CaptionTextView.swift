
import UIKit

class CaptionTextView: UITextView {
    
    // MARK: - Properties
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "What's happening?"        
<<<<<<< HEAD
=======
        return label
    }()
    
    let numberOfCharacteres: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = #colorLiteral(red: 0.3761813763, green: 0.3627229793, blue: 0.3350707148, alpha: 0.4507690222)
        label.text = "1/140"
>>>>>>> develop
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?){
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        
        isScrollEnabled = true
        heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 4)

        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - API
    
    
    // MARK: - Selectors
    
    @objc func handleTextInputChange(){
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    // MARK: - Helpers
}
