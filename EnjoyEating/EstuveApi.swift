//
//  EstuveApi.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 21/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation
import Alamofire


class EstuveApi {
    
    let url = "https://test-isabel-restaurante.herokuapp.com/estuve"
    
    func getEstuve(idUs: String, callback: @escaping (Array<Estuve>) -> Void) {
        
        var data: [Estuve]  = []
        
        Alamofire.request(url + "/" + idUs, method: .get).responseJSON { (response) in
            
            var json = [NSDictionary]()
            json = response.result.value as! [NSDictionary]
            
            for i in 0 ..< json.count{
                let guardar = json[i]
                let idUs = guardar["idUs"] as? String!
                let placeid = guardar["placeid"] as? String
                let nombre = guardar["nombre"] as? String
                let imagen = guardar["imagen"] as? String
                
                let guardar_obj = Estuve(idUs: idUs!, placeid: placeid!, nombre: nombre!,  imagen: imagen!)
                
                data.append(guardar_obj)
            }
            callback (data)
        }
    }
    
    func addEstuve(idUs: String, placeid: String, nombre: String,  imagen: String, callback: @escaping (Bool) -> Void){
        let parametros: Parameters = ["idUs": idUs, "placeid": placeid, "nombre": nombre, "imagen": imagen]
        
        Alamofire.request(url, method: .post, parameters: parametros).responseJSON{ (response) in
            
            let json = response.result.value as! [String: Any]
            
            let succ = json["success"] as! Bool
            if succ {
                print("Restaurante en que estuvo registrado con exito")
                callback(true)
            }
        }
    }
}
