//
//  BookmarksViewController.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 3.11.2022.
//  
//

import UIKit

class BookmarksViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var BookmarksPresenter: ViewToPresenterBookmarksProtocol?
    private var items: [Bookmarks] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        BookmarksRouter.execModule(ref: self)
        makeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BookmarksPresenter?.didViewLoad()
     }

    func makeUI() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize  = CGSize(width: 100, height: 250)
        collectionView.collectionViewLayout = layout
        collectionView.register(BookmarksCollectionViewCell.nib(), forCellWithReuseIdentifier: BookmarksCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension BookmarksViewController: PresenterToViewBookmarksProtocol{
    // TODO: Implement View Output Methods
    func updateUI(with items: [Bookmarks]) {
        self.items = items
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        print(self.items)
    }
    
    
}

extension BookmarksViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let data = items[indexPath.row]
        BookmarksPresenter?.didItemPressed(data: data)
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        detailsVC?.bookmarkObject = data
        detailsVC?.isBookmark = true
        self.navigationController?.pushViewController(detailsVC!, animated: true)
        }
    
}

extension BookmarksViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarksCollectionViewCell.identifier, for: indexPath) as! BookmarksCollectionViewCell
         let newsItem = items[indexPath.row]
        cell.configure(image: newsItem.imageUrl!, title: newsItem.title ?? "News Title")
        return cell
    }
}

extension BookmarksViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftAndRightPaddings: CGFloat = 15.0 // things gets messy below that number
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width + 50)

    }

}
