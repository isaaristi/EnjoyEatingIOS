//
//  DetallesViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 18/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit
import SDWebImage

class DetallesViewController: UIViewController {

    
    var restaurante: Restaurante!
    
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var telefono: UILabel!
    @IBOutlet weak var direccion: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = restaurante.nombre
        id.text = restaurante.placeid
        direccion.text = restaurante.direccion
        //telefono.text = restaurante.telefono
        tipo.text = restaurante.tipo
        imagen.sd_setImage(with: URL(string: restaurante.imagen))
               

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
