//
//  TiposViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 18/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class TiposViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    var tipo_dato: [Tipo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipo_dato = [
            
            Tipo(nom: "Restaurante tradicional", img: "dish.png", valor: "tradicional"),
            Tipo(nom: "Restaurante tipico", img: "saladlogo.png", valor: "tipico"),
            Tipo(nom: "Comida rápida", img: "sandwich.png", valor: "rapidas")
            
        ]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipo_dato.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TiposCelda") as! TiposCell
        let t = tipo_dato[indexPath.row]
        
        cell.nom.text = t.nom
        cell.img.image = UIImage (named: t.img)
        
        
        return cell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
