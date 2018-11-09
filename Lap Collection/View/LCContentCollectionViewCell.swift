//
//  LCContentCollectionViewCell.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 04/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import UIKit

class LCContentCollectionViewCell: UICollectionViewCell {
    
    let contentView1: UITextView = {
        let contentView = UITextView()
        contentView.font = UIFont.preferredFont(forTextStyle: .body)
        contentView.isEditable = false
        contentView.isScrollEnabled = false
        contentView.adjustsFontForContentSizeCategory = true
        contentView.textContainerInset = UIEdgeInsets.init(top: 10, left: 5, bottom: 0, right: 5)
        contentView.textAlignment = .justified  
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    var lapCollection: LapCollectionViewModel!{
        didSet {
            contentView1.text = lapCollection.description
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        addSubview(contentView1)
        contentView1.fillAll()
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
