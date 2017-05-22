//
//  ResenaViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 21/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit

class ResenaViewController: UIViewController, UITableViewDataSource {
    
    var resenaRes: String!
    var resenaId: String!
    var api: ResenaApi!
    var data: [Resena] = []
    
    @IBOutlet weak var nombre: UILabel!

    @IBOutlet weak var placeid: UILabel!
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var descri: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placeid.text = UserDefaults().object(forKey: "username") as? String
        nombre.text = resenaRes
       // placeid.text = resenaId
        
        api = ResenaApi()
        
        api.getResenas(idRes: resenaId) { (resena) in
            self.data = resena
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResenaCelda") as! ResenaCell
        let r = data[indexPath.row]
        
        cell.nombreUs.text = r.idUs
        cell.descripcion.text = r.descripcion
        
        return cell
    }
    
    
    @IBAction func enviar(_ sender: Any) {
        
        let idRes = resenaId
        let idUs = UserDefaults().object(forKey: "username") as? String
        let descripcion = descri.text
        
        api = ResenaApi()
        
        api.addResena(idRes: idRes!, idUs: idUs!, descripcion: descripcion!) { (resena) in
            self.table.reloadData()
        }
        
    }
   

}
