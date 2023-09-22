import UIKit


class CollectionViewController: UIViewController {
    
    var dataManager = DataManager()
    
    
    
    @IBOutlet weak var pCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.reloadClosure = {
            self.pCollectionView.reloadData()
        }
        
        collectionViewConfigure()
        self.dataManager.fetchTask()
        
    }
    
    func alertConfigure(){
        
        let alert = UIAlertController(title: "입력하세요", message: "제목을입력하세요", preferredStyle: UIAlertController.Style.alert)
        
        //MARK: - 얼럿창으로 텍스트 주입
        let okAction = UIAlertAction(title: "입력", style: .default) { (ok) in
            //태스크 클래스 관리 따로 빼서 하기
            self.dataManager.append(alert.textFields?[0].text ?? "")
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.addTextField()
        
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func addButton(_ sender: Any) {
        alertConfigure()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        self.dataManager.deleteAndFetch()
    }
    private func collectionViewConfigure(){
        pCollectionView.dataSource = self
        pCollectionView.delegate = self
        
        pCollectionView.collectionViewLayout = collectionLayoutConfigure()
    }

}

extension CollectionViewController {
    //MARK: - 콜렉션뷰 레이아웃
        private func collectionLayoutConfigure() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout{
                (sectionIndex: Int, layoutEnvironment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/5))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                return section
            }
            return layout
        }
}


extension CollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        //태스크 클래스 관리 따로 빼서 하기
        self.dataManager.edit(indexPath.row)
    }
}


extension CollectionViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataManager.tasks?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! CollectionViewCell
        
        let task = self.dataManager.tasks![indexPath.row]
        cell.test.text = task.title
        cell.secondLabel.text = task.id?.uuidString
        cell.createdDate.text = dateFormatter.dateFormat(task.date ?? Date())
        if task.modifyDate == nil {
            cell.editedDate.text = "수정안됨"
        }else{
            cell.editedDate.text = dateFormatter.dateFormat(task.modifyDate ?? Date.distantFuture)
        }
        
        if task.isCompleted {
            cell.contentView.backgroundColor = .gray
        }else{
            cell.contentView.backgroundColor = .red
        }
        
        return cell
    }
    
}
