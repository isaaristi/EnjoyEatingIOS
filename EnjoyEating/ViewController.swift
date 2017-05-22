//
//  ViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 15/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var user: UITextField!
    
    var userD: UserDefaults!
    
    var api: UsuariosApi!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userD = UserDefaults()
        
        //let username = userD.object(forKey: "username") as? String
        
        let username =  userD.object(forKey: "username") as? String
        user.text = username
        let password = userD.object(forKey: "password") as? String
        pass.text = password
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: Any) {
        
        let password = pass.text
        let username = user.text
        
        api = UsuariosApi()
        
        api.Login(username: username!, password: password!) { (usuario) in
            
            if (username == usuario.username && password == usuario.password){
                
                self.userD.set(username, forKey: "username")
                self.userD.set(password, forKey: "password")
                self.userD.set(true, forKey:"logged")
                
                self.performSegue(withIdentifier: "principal", sender: nil)
            }
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registro" {
       // let principal = segue.destination as! RegistroViewController
        }
    }
    
    
    @IBAction func goToMain(_ segue:UIStoryboardSegue){
        
    }


}

