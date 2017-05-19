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
    
    let url = "https://test-isabel-restaurante.herokuapp.com/"
    
    
    func getRestaurante(callback:@escaping (Array<Restaurante> )->Void){
        
        var data: [Restaurante] = []
        var dato: [Menu] = []
        
        Alamofire.request(url+"restaurante", method: .get).responseJSON { (response) in
            var json = [NSDictionary]()
            var json1 = [NSDictionary]()
            json = response.result.value as! [NSDictionary]
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
            
            dato = []
            
            data.append(restaurante_obj)
        }
            
        callback (data)
            
        }
    }
    
    func getIngredientes(callback:@escaping (Array<Menu> )->Void){
        
        var data_menu: [Menu] = []
        
        Alamofire.request(url+"restaurante/all/menus", method: .get).responseJSON { (response) in
            var json = [NSDictionary]()
            json = response.result.value as! [NSDictionary]
            for i in 0 ..< json.count{
                let menu = json[i]
                let nombre = menu["nombre"] as? String
                let imagen = menu["imagen"] as? String
                let precio = menu["precio"] as? String
                let ingredientes = menu["ingredientes"] as? [String]
                
                let menu_obj = Menu(nombre: nombre!, precio: precio!, imagen: imagen!, ingredientes: ingredientes!)
                
                data_menu.append(menu_obj)
            }
        callback (data_menu)
            
        }
    }
    
    
}
