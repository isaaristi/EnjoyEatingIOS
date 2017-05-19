//
//  UsuariosApi.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 19/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation
import Alamofire

class UsuariosApi {
   // var usuario: [Users] = []
    
    
    let url = "https://test-isabel-restaurante.herokuapp.com/"
    
    
    func Login(username:String, password:String ,callback:@escaping (Users) ->Void){
        
        let parametros: Parameters = ["username": username, "password": password]
        
        Alamofire.request(url+"users/login", method: .post,   parameters: parametros ).responseJSON{ (response) in
            
            let json = response.result.value as! [String: Any]
            let usuario = json["usuario"] as! [String: Any]
            let username = usuario["username"] as! String
            let password = usuario["password"] as! String
            let email = usuario["email"] as! String
            
            let user = Users(username: username, email: email, password: password)
            
            callback(user)
            
        }
        
    }
    
    
}
