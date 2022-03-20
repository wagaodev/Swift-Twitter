import UIKit

class TweetCell: UICollectionViewCell {
  override init(frame: CGRect){
    super.init(frame: frame)
    
    backgroundColor = .red
  }
  
  required init?(coder: NSCoder){
    fatalError("INIT(Coder) has not been implemented")
  }
}
