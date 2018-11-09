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
            setImageLC(url: lapCollection.imageUrl)
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
    
    func setImageLC(url: String){
        if let url = URL(string: url){
            let size = CGSize(width: 75, height: 75)
            let filter = AspectScaledToFillSizeWithRoundedCornersFilter(size: size, radius: 5)
            let placeholder = UIImage(named: "placeholder")?.af_imageAspectScaled(toFill: size)
            imageView?.af_setImage(withURL: url, placeholderImage: placeholder, filter: filter, imageTransition: .crossDissolve(0.2))
        }
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


    


