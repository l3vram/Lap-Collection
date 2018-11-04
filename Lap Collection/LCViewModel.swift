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
static let url = "http://private-f0eea-mobilegllatam.apiary-mock.com/list"
static let showDetail = "showDetail"
static let placeholder = "placeholder"
}

func getLapData(completion: @escaping ([Lap]?,Error?)-> Void){
    var lapdata: [Lap]?
    Alamofire.request(Const.url).responseData{response in
        do{
            switch response.result{
            case .success(let data):
                lapdata = try JSONDecoder().decode([Lap].self, from: data)
                completion(lapdata,nil)
            case .failure(let error):
                completion(nil,error)
            }
        }catch let error{
            completion(nil,error)
        }
    }
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
}
