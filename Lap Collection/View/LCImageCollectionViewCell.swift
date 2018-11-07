//
//  LCCollectionViewCell.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 04/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import UIKit

class LCImageCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        return imageView
    }()
    
    var lapCollection: LapCollectionViewModel!{
        didSet {
            imageView.image = lapCollection.image.image
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        addSubview(imageView)
        imageView.fillAll()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
