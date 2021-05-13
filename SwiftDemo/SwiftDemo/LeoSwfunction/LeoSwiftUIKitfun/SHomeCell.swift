//
//  SHomeCell.swift
//  SwiftDemo
//
//  Created by admin on 2021/4/21.
//

import UIKit

class SHomeCell: UICollectionViewCell {
    var titleLabel: UILabel!
       var imageView: UIImageView!
       
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           
           imageView = UIImageView()
           imageView.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.width)
           imageView.contentMode = .scaleAspectFit
           
           titleLabel = UILabel(frame: CGRect(x: 0, y: imageView.frame.origin.y + imageView.frame.size.width + 10, width: self.bounds.size.width, height: 20))
           titleLabel.textAlignment = .center
           
           addSubview(imageView)
           addSubview(titleLabel)
           self.backgroundColor = UIColor.randomColor
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}
