//
//  ResenaApi.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 21/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation
import Alamofire

class ResenaApi {
    
    let url = "https://test-isabel-restaurante.herokuapp.com/resena/"
    
    
    func getResenas(idRes: String, callback: @escaping (Array<Resena>) -> Void) {
        
        var data: [Resena]  = []
        
        Alamofire.request(url + idRes, method: .get).responseJSON { (response) in
            
            var json = [NSDictionary]()
            json = response.result.value as! [NSDictionary]
            
            for i in 0 ..< json.count{
                let resena = json[i]
                let idRes = resena["idRes"] as! String!
                let idUs = resena["idUs"] as! String!
                let descripcion = resena["descripcion"] as! String!
            
                let resena_obj = Resena(idRes: idRes!, idUs: idUs!, descripcion: descripcion!)
                
                data.append(resena_obj)
            }
            callback(data)
            
        }
    }
    
}
