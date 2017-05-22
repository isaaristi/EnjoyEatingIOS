//
//  RegistroViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 15/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class RegistroViewController: UIViewController {

    @IBOutlet weak var contrasena: UITextField!
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var usuario: UITextField!
    
    var userD: UserDefaults!
    
    var api: UsuariosApi!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userD = UserDefaults()
        
        let username = userD.object(forKey: "username") as? String
        usuario.text = username
        let password = userD.object(forKey: "password") as? String
        contrasena.text = password
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registro(_ sender: Any) {
        let password = contrasena.text
        let username = usuario.text
        let email = correo.text
        
        api = UsuariosApi()
        
        api.registro(username: username!, email: email!, password: password!) { (usuario) in
            
            self.userD.set(username, forKey: "username")
            self.userD.set(password, forKey: "password")
            self.userD.set(true, forKey:"logged")
            
            self.performSegue(withIdentifier: "principal", sender: nil)
            
        }
    }
  

}
