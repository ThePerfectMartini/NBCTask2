
import UIKit

class ProfileDesignViewController: UIViewController {
    
    var images:[String] = []
    
    var profileViewModel = ProfileViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...7 {
            images.append("picture (\(i))")
        }
        
        collectionViewConfigure()
        configure()
        
        
        
    }
    @IBAction func backToHome(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func collectionViewConfigure(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = collectionLayoutConfigure()
    }
    
    func configure(){
        messageButton.layer.cornerRadius = 4
        messageButton.layer.borderWidth = 1.5
        messageButton.layer.borderColor =  UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        
        moreButton.layer.cornerRadius = 4
        moreButton.layer.borderWidth = 1.5
        moreButton.layer.borderColor =  UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor

    }
    private func collectionLayoutConfigure() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1/3))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            return section
        }
        return layout
    }
}

extension ProfileDesignViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}
extension ProfileDesignViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ProfileDesignViewCell
        cell.image.image = UIImage(named: images[indexPath.item])
        
        cell.contentView.backgroundColor = .black
        return cell
    }
    
}
