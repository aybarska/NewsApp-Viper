//
//  HomeViewController.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 30.10.2022.
//  
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var items: [NewsCellViewModel] = []
    
    // MARK: - Properties
     var presenter: ViewToPresenterHomeProtocol?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        presenter?.didViewLoad()
        makeUI()
    }
    
    func makeUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize  = CGSize(width: 100, height: 250)
        collectionView.collectionViewLayout = layout
        collectionView.register(NewsCollectionViewCell.nib(), forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
}

extension HomeViewController: PresenterToViewHomeProtocol{
    func showLoading() {
        //
    }
    
    func hideLoading() {
        //
    }
    
    func showAlert(with message: String?) {
        let alert = UIAlertController(title: "Careful", message: message, preferredStyle: UIAlertController.Style.alert)
                  
                  alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                      print("canceled")
                       }))
                  
                  alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                      print("done")
                       }))
        
                  self.present(alert, animated: true, completion: nil)
    }
    
    func updateUI(with items: [NewsCellViewModel]) {
        //
    }
    

    
    // TODO: Implement View Output Methods
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        //detailsVC?.selectedNewsData = new
        //detailsVC?.title = new.title
        //self.navigationController?.pushViewController(detailsVC!, animated: true)
        }
    
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count //TODO return news count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as! NewsCollectionViewCell
//        let new = news[indexPath.row]
//        cell.configure(image: UIImage(named: new.image)!, title: new.title,isReaded: new.isReaded)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftAndRightPaddings: CGFloat = 15.0 // things gets messy below that number
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width + 50)

    }

}