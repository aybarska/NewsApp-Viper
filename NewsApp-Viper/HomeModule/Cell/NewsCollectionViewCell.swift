//
//  NewsCollectionViewCell.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 12.09.2022. 🧚🏻‍♀️
//

import UIKit


class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelView: UIView! 
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    static let identifier = "NewsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shapeImage(desiredImage: imageView)
    }
   
    override func draw(_ rect: CGRect) {
        //make gradient size equal to imageview size
        super.draw(rect)
        drawGradient(desiredView: imageView)
    }
    
    static func nib()-> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    public func configure(image: UIImage,title: String, isReaded: Bool) {
        titleLabel.text = title
        imageView.image = image
    }
                
    
    public func drawGradient(desiredView: UIView) {
        //creates new view and puts front of desired one with gradient
        var bottomColor = UIColor.black.cgColor
        if self.traitCollection.userInterfaceStyle == .dark {
            //if client is in dark mode, gradient will be grayish
            bottomColor = UIColor.darkGray.cgColor
        }
        
        let view = UIView(frame: desiredView.frame)
        let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.clear.cgColor, bottomColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
        desiredView.addSubview(view)
        desiredView.bringSubviewToFront(view)
    }
    
    public func shapeImage(desiredImage: UIView) {
        //cool image shape
        desiredImage.layer.cornerRadius = 20
        desiredImage.clipsToBounds = true
        desiredImage.layer.shadowRadius = 20
        desiredImage.layer.shadowOpacity = 1.0
        desiredImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        desiredImage.layer.shadowColor = UIColor.gray.cgColor
    }

}




