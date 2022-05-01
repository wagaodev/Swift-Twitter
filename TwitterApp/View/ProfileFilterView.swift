
import UIKit

class ProfileFilterView: UIView {

  // MARK: - Properties

  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
//    cv.delegate = self
//    cv.dataSource = self
    return cv
  }()

  // MARK: - Lifecycle

  override init(frame: CGRect){
    super.init(frame: frame)
    configureUI()
  }

  func configureUI(){
    backgroundColor = .red
  }

  required init?(coder: NSCoder){
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - API

  // MARK: - Selectors

  // MARK: - Helpers

}

