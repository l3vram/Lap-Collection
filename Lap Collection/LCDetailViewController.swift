//
//  LCDetailViewController.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 04/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import UIKit

class LCDetailViewController: UIViewController {
    
    var imag = UIImageView()
    var lap: Lap?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDetail()
    }
    
    func initDetail(){
        navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.isTranslucent = true
        //self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
}
