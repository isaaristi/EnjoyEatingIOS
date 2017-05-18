//
//  RestauranteApi.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 17/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation
import Alamofire

class RestauranteApi {
    
    var userD: UserDefaults!
    
    
    let url = "https://test-isabel-restaurante.herokuapp.com/restaurante"
    
    func getRestaurante(callback:@escaping (Array<Restaurante> )->Void){
        
       // let body:[String:Any] = ["nombre": "Isabel", "Usuario": "isaaristi", "edad":22]
        var data: [Restaurante] = []
        
        var dato: [Menu] = []
        
        Alamofire.request(self.url, method: .get).responseJSON { (response) in
            var json = [NSDictionary]()
            var json1 = [NSDictionary]()
            json = response.result.value as! [NSDictionary]
            
            
            //let restaurante = Restaurante()
            
        for i in 0 ..< json.count{
            let restaurante = json[i]
            let placeid = restaurante["placeid"] as? String
            let nombre = restaurante["nombre"] as? String
            let direccion = restaurante["direccion"] as? String
            let logo = restaurante["logo"] as? String
            let telefono = restaurante["telefono"] as? String
            let tipo = restaurante["tipo"] as? String
            let imagen = restaurante["imagen"] as? String
            json1 = (restaurante["menu"] as? [NSDictionary])!
            
            for j in 0 ..< json1.count {
                let menu = json1[j]
                let menu_nombre = menu["nombre"] as? String
                let menu_precio = menu["precio"] as? String
                let menu_imagen = menu["imagen"] as? String
                let menu_ingredientes = menu["ingredientes"] as? [String]
                
                let menu_obj = Menu(nombre: menu_nombre!, precio: menu_precio!, imagen: menu_imagen!, ingredientes: menu_ingredientes!)
                
                
                dato.append(menu_obj)
            }
            
            
            
            let restaurante_obj = Restaurante(placeid: placeid!, nombre: nombre!, logo: logo!, imagen: imagen!, direccion: direccion!, telefono: telefono!, menu: dato, tipo: tipo!)
            
            data.append(restaurante_obj)
        }
        callback (data)
            
        }
        
        
    }
}
