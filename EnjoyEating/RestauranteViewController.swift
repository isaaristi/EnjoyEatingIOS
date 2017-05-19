//
//  RestauranteViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 18/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class RestauranteViewController: UIViewController, UITableViewDataSource {
    

    @IBOutlet weak var table: UITableView!
    
    var data1 = [NSMutableDictionary]()
    
    var data: [Restaurante] = []
    
    var api: RestauranteApi!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        api = RestauranteApi()
        
        api.getRestaurante {  (restaurantes) in
            self.data = restaurantes
            self.table.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table Datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestauranteCelda") as! RestauranteCell
        let r = data[indexPath.row]
        
        cell.nombre.text = r.nombre
        cell.imagen.sd_setImage(with: URL(string:r.imagen))
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "detalles" {
            let selected = table.indexPathForSelectedRow?.row
            let destination = segue.destination as! DetallesViewController
            
            destination.restaurante = data[selected!]
        }
    }
    

}

/*data = [
 Restaurante(placeid: "hokdfogkdf", nombre: "El Quijote Terraza Barbacoa", logo: "http://off2colombia.com.co/images/destinations/the-south/popayan/popayan-el-quijote.jpg", imagen: "http://off2colombia.com.co/images/destinations/the-south/popayan/popayan-el-quijote.jpg", direccion: "Calle 10 #9-17", telefono: 8234104, menu: [Menu(nombre: "hola", precio: "hola", imagen: "hola", ingredientes: ["hola", "hola", "hola"])], tipo: "Restaurante tradicional" )
 
 ]*/
