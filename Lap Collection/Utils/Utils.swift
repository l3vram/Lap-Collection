//
//  LCViewModel.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 03/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import Foundation
import Alamofire

enum Const{
    static let cellid = "cellid"
    static let cellidImage = "cellidImage"
    static let cellidTitle = "cellidTitle"
    static let cellidContent = "cellidContent"
    static let url = "http://private-f0eea-mobilegllatam.apiary-mock.com/list"
    static let showDetail = "showDetail"
    static let showDetail1 = "showDetail1"
    static let placeholder = "placeholder"
    static let reuseIdentifier = "Cell"
}

extension UIView{
    
    func position(top: NSLayoutYAxisAnchor?,leading: NSLayoutXAxisAnchor?,bottom: NSLayoutYAxisAnchor?,trailing: NSLayoutXAxisAnchor?,padding: UIEdgeInsets = .zero, size: CGSize = .zero)  {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }    
    func sizeEqual(to view: UIView){
        widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    func fillAll() {
        position(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func styleCell(){
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 15
    }
}

