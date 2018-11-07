//
//  LCTableViewCell.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 04/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import UIKit
import AlamofireImage

class LCTableViewCell: UITableViewCell {
   
    var lapCollection: LapCollectionViewModel!{
        didSet {
            textLabel?.text = lapCollection.title
            detailTextLabel?.text = String(lapCollection.description.prefix(100))
            imageView?.image = lapCollection.image.image?.af_imageRounded(withCornerRadius: 5)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: Const.cellid)
        initStyles()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initStyles(){
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        detailTextLabel?.numberOfLines = 0
        detailTextLabel?.textColor = UIColor.darkGray
        textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel?.textColor = DPTheme.color(hex: 0x43a3a8, alpha: 1.0)
        textLabel?.backgroundColor = .blue
        textLabel?.layer.cornerRadius = 5
        textLabel?.clipsToBounds = true
    }

}
