//
//  LapCollectionViewModel.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 07/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import Foundation
import UIKit


struct LapCollectionViewModel {
    
    let title: String
    let description: String
    var imageUrl: String
    
    init(model: LapCollection) {
        self.title = model.title
        self.description = model.description
        self.imageUrl = model.image
       
    }
}
