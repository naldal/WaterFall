//
//  ImageCollectionViewCell.swift
//  Waterfall
//
//  Created by 송하민 on 2021/07/19.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageVIew = UIImageView()
        imageVIew.contentMode = .scaleAspectFill
        return imageVIew
    }()
    
    /*
     To use UICollectionCell to UIImageView,
     it need to use "addSubview" into contentView which is content of the Collection view cell.
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.clipsToBounds = true
    }
    
    // why need this: NSCoding protocol let child class which is implemented from NSCoding make failurable initializer.
    // required : Child class must implemnet this initializer.
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // override from UIView
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    // override from UIControlViewCell
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(image: UIImage?) {
        imageView.image = image
    }
}
