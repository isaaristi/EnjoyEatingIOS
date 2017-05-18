//
//  PrincipalViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 17/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit
import SDWebImage

class PrincipalViewController: UIViewController, UITableViewDataSource {
    
    var data1 = [NSMutableDictionary]()
    
    var data: [Restaurante] = []
    
    var api: RestauranteApi!
    
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet var controller: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        api = RestauranteApi()
        
        api.getRestaurante {  (restaurantes) in
            self.data = restaurantes
            self.table.reloadData()
        }
    }
    
    private func setupView(){
        setupSegmentedControl()
        
        updateView()
        }
    
    private func setupSegmentedControl() {
        controller.removeAllSegments()
        controller.insertSegment(withTitle: "Restaurante", at: 0, animated: false)
        controller.insertSegment(withTitle: "Tipos", at: 1, animated: false)
        controller.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
                
                // Select First Segment
        controller.selectedSegmentIndex = 0
        
            }
    
    @objc private func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
            private lazy var restauranteViewController: RestauranteViewController = {
                // Load Storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                
                // Instantiate View Controller
                var viewController = storyboard.instantiateViewController(withIdentifier: "Restaurante") as! RestauranteViewController
                
                // Add View Controller as Child View Controller
                self.add(asChildViewController: viewController)
                
                return viewController
            }()
            
            private lazy var tiposViewController: TiposViewController = {
                // Load Storyboard
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                
                // Instantiate View Controller
                var viewController = storyboard.instantiateViewController(withIdentifier: "Tipos") as! TiposViewController
                
                // Add View Controller as Child View Controller
                self.add(asChildViewController: viewController)
                
                return viewController
            }()    
        
        /*data = [
            Restaurante(placeid: "hokdfogkdf", nombre: "El Quijote Terraza Barbacoa", logo: "http://off2colombia.com.co/images/destinations/the-south/popayan/popayan-el-quijote.jpg", imagen: "http://off2colombia.com.co/images/destinations/the-south/popayan/popayan-el-quijote.jpg", direccion: "Calle 10 #9-17", telefono: 8234104, menu: [Menu(nombre: "hola", precio: "hola", imagen: "hola", ingredientes: ["hola", "hola", "hola"])], tipo: "Restaurante tradicional" )
            
        ]*/


        // Do any additional setup after loading the view.
    
    
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    private func updateView() {
        if controller.selectedSegmentIndex == 0 {
            remove(asChildViewController: restauranteViewController)
            add(asChildViewController: tiposViewController)
        } else {
            remove(asChildViewController: restauranteViewController)
            add(asChildViewController: tiposViewController)
        }
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
    
    
    
    //MARK: Segue
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalles" {
            
            let selected = table.indexPathForSelectedRow?.row
            let destination = segue.destination as! DetallesViewController
            
            destination.restaurante = data[selected!]
            
            //let registro = segue.destination as! RegistroViewController
        }
        //Se pasan los datos de las variables creadas en el registroViewController para obtener la informacion
    }
    
    //MARK: Delegate Table
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     let r = data[indexPath.row]
     let alert = UIAlertController(title: r.nombre, message: "Seleccionaste un  restaurante", preferredStyle: .alert)
     
     let ok = UIAlertAction(title:"OK", style: .default) { (alert) in
     print("Alert ok")
     }
     
     let cancel = UIAlertAction(title: "Cancelar", style: .cancel) {
     (alert) in
     print("Alert cancel")
     
     }
     
     alert.addAction(ok)
     alert.addAction(cancel)
     
     present(alert, animated: true, completion: nil)
     }*/
    
    

}
