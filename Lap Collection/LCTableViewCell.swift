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

    var lap: Lap? {
        didSet {
            guard let templap = lap else {return}
            textLabel?.text = templap.title
            detailTextLabel?.text = templap.description.prefix(100) + "..."
            if let url = templap.image{
                let size1 = CGSize(width: 75.0, height: 75.0)
                let filter = AspectScaledToFillSizeCircleFilter(size: size1)
                let placeholder = UIImage(named: Const.placeholder)?.af_imageAspectScaled(toFit: size1).af_imageRoundedIntoCircle()
                if let url = URL(string: url){
                imageView?.af_setImage(withURL: url, placeholderImage: placeholder, filter: filter,  imageTransition: .crossDissolve(0.2))
                }
            }
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
        textLabel?.textColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        textLabel?.backgroundColor = .blue
        textLabel?.layer.cornerRadius = 5
        textLabel?.clipsToBounds = true
    }

}