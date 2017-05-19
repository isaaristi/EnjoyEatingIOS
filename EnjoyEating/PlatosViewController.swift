//
//  PlatosViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 18/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit
import SDWebImage

class PlatosViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var menu: [Menu] = []
    
    var api: RestauranteApi!

    override func viewDidLoad() {
        super.viewDidLoad()

        api = RestauranteApi()
        
        api.getIngredientes { (ingredientes) in
            self.menu = ingredientes
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
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlatosCelda") as! PlatosCell
        let p = menu[indexPath.row]
        
        cell.nombre.text = p.nombre
        cell.imagen.sd_setImage(with: URL(string:p.imagen))
        cell.precio.text = p.precio
        cell.ingredientes.text = [NSString .strings(p.ingredientes)]

        return cell
    }
    

}
