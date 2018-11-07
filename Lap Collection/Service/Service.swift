//
//  Service.swift
//  Lap Collection
//
//  Created by Marvel Alvarez Rojas on 07/11/2018.
//  Copyright © 2018 Marvel Alvarez Rojas. All rights reserved.
//

import Foundation
import Alamofire

class Service{
    
    static let shared = Service()
    
    func getLapData(completion: @escaping ([LapCollection]?,Error?)-> Void){
        var lapdata: [LapCollection]?
        Alamofire.request(Const.url).responseData{response in
            do{
                switch response.result{
                case .success(let data):
                    lapdata = try JSONDecoder().decode([LapCollection].self, from: data)
                    completion(lapdata,nil)
                case .failure(let error):
                    completion(nil,error)
                }
            }catch let error{
                completion(nil,error)
            }
        }
    }
    
}
