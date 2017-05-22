//
//  UsuariosApi.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 19/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation
import Alamofire
import UIKit


class UsuariosApi {
   // var usuario: [Users] = []
    
    
    let url = "https://test-isabel-restaurante.herokuapp.com/"
    
    func alert (title: String, message: String){
        let alerta = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alerta.dismiss(animated: true, completion: nil)
        }))
    }
    
    
    func Login(username:String, password:String ,callback:@escaping (Users) ->Void){
        
        let parametros: Parameters = ["username": username, "password": password]
        
        Alamofire.request(url+"users/login", method: .post,   parameters: parametros ).responseJSON{ (response) in
            
            switch response.result{
            
            case .success:
            let json = response.result.value as! NSDictionary
            let success = json["success"] as! Bool
            
            if success {
            let usuario = json["users"] as! [String: Any]
            let username = usuario["username"] as! String
            let password = usuario["password"] as! String
            //let email = usuario["email"] as! String
            
            let user = Users(username: username, email: "", password: password)
            
            callback(user)
        }
            else {
                
                self.alert(title: "Usuario o contraseña inválidos", message: "Vuelva a intentar o regístrese")
    }
                
            case .failure:
                let usuario = Users(username: "", email: "", password: "")
                print("Hubo un error con la red")
                callback(usuario)
    
            }
        }
    }
    
    
    func registro(username:String, email:String, password:String, callback:@escaping (Bool) ->Void){
        
        let parameters: Parameters=["username": username, "email": email  , "password": password ]
        
        Alamofire.request(url+"users/signin", method:.post,   parameters: parameters ).responseJSON{(response) in
            
            let json = response.result.value as! [String: Any]
            
            let succ = json["success"] as! Bool
            if !succ {
                
                self.alert(title: "Usuario o contraseña inválidos", message: "Vuelva a intentar o regístrese")
                
                print ("el usuario ya existe")
                callback (false)
            }
            
            if succ {
                
                print("usuario registrado con exito")
                callback (true)
                
            }
            
            
            
            
            
            
        }
        
    }

}

