//
//  MapaApi.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 20/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation
import Alamofire

class MapaApi{
    
    func getMapa (placeid: String, callback: @escaping (Mapa) -> Void){
        
        
        
        let url = "https://maps.googleapis.com/maps/api/place/details/json?placeid="+placeid+"&key=AIzaSyA6fgLgJdUSb2syfbAjJSVSnebwzgpa1Zw"
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
           
            let json = response.result.value as! NSDictionary
            let mapa = Mapa()
            
            let result = json["result"] as! [String: Any]
            let geometry = result["geometry"] as! [String:Any]
            let location = geometry["location"] as! [String:Any]
            mapa.latitud = location["lat"] as! Double
            mapa.longitud = location["lng"] as! Double
           
            callback(mapa)
        }
        
    }
    
    
    
    
    
    
}
