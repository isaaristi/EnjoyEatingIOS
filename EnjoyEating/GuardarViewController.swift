//
//  GuardarViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 21/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class GuardarViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var table: UITableView!
    
    var data: [Guardar] = []
    
    var api: GuardarApi!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let idUs = UserDefaults().object(forKey: "username") as! String

        api = GuardarApi()
        
        api.getGuardar(idUs: idUs) { (guardar) in
            self.data = guardar
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GuardarCelda") as! GuardarCell
        let r = data[indexPath.row]
        
        cell.nombre.text = r.nombre
        cell.imagen.sd_setImage(with: URL(string:r.imagen))
        
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
