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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userD = UserDefaults()
        
        let username = userD.object(forKey: "username") as? String
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func login(_ sender: Any) {
        let password = pass.text
        let username = user.text
        
        if (username == "abc" && password == "abc"){
            
            userD.set(username, forKey: "username")
            userD.set(password, forKey: "password")
            userD.set(true, forKey:"logged")
            
            performSegue(withIdentifier: "Principal", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registro" {
        let principal = segue.destination as! RegistroViewController
        }
    }
    
    @IBAction func goToMain(_ segue:UIStoryboardSegue){
        
    }


}

