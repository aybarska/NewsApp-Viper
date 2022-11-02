//
//  DetailViewController.swift
//  NewsApp-Viper
//
//  Created by Ayberk Mogol on 2.11.2022.
//  
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    // MARK: - Properties
    var DetailPresenter: ViewToPresenterDetailProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    
    var item: NewsCellViewModel?
    var isBookmark: Bool = false
    var bookmarkObject: Bookmarks?
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailRouter.execModule(ref: self)
        fillUI()

    }


    @IBAction func bookmarkButton(_ sender: Any) {
        if(isBookmark) {
            DetailPresenter?.sendBookmarkDelete(data: bookmarkObject!)
        } else {
            DetailPresenter?.sendBookmarkAdd(data: item!)
            //button.titleLabel?.text = "Remove Bookmark"
            
        }
    }
    
    func fillUI() {
        if(isBookmark) {
            print("is bookmark? \(isBookmark)")
           titleLabel.text = bookmarkObject?.title
            contentLabel.text = bookmarkObject?.content
            imageView.sd_setImage(with: URL(string: bookmarkObject?.imageUrl ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"), placeholderImage: UIImage(named: "noResult"))
            button.titleLabel?.text = "Remove Bookmark"
        } else {
            titleLabel.text = item?.title
            contentLabel.text = item?.content
            imageView.sd_setImage(with: URL(string: item?.imageUrl ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"), placeholderImage: UIImage(named: "noResult"))
            button.titleLabel?.text = "Add Bookmark"
        }

    }

}

extension DetailViewController: PresenterToViewDetailProtocol{
    // TODO: Implement View Output Methods
}
