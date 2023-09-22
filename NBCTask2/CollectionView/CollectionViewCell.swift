import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var editedDate: UILabel!
    @IBOutlet weak var createdDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
