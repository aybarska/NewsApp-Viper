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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fillUI()
     }

    @IBAction func bookmarkButton(_ sender: Any) {
        if(isBookmark) {
            let alert = UIAlertController(title: "Careful", message: "Bookmark will be removed.", preferredStyle: UIAlertController.Style.alert)
               
               alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                   print("canceled")
                   //self.makeUI()
                   self.button.setTitle("Remove Bookmark", for: .normal)
                    }))
               
               alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                   
                     self.DetailPresenter?.sendBookmarkDelete(data: self.bookmarkObject!)
                     self.navigationController?.popViewController(animated: true)
                    }))
               
               self.present(alert, animated: true, completion: nil)
            
           
        } else {
            //MARK: Her bookmark eklendiginde firebase analytics gonder.
            
            DetailPresenter?.sendBookmarkAdd(data: item!)
            button.setTitle("Bookmark Added", for: .normal)
            isBookmark = true
            button.isEnabled = false

        }
    }
    
    func fillUI() {

        if(isBookmark) {
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
