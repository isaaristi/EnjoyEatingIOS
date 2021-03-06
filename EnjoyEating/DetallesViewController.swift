//
//  DetallesViewController.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 18/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import UIKit
import SDWebImage
import MapKit

class DetallesViewController: UIViewController {

    //Popayán, Cauca, Colombia 2.452473, -76.602895
    
    var restaurante: Restaurante!
    var api: MapaApi!
    var data: Mapa!
    var api1: GuardarApi!
    var api2: EstuveApi!
    
    var lat: CLLocationDegrees = 2.452473
    var long: CLLocationDegrees = -76.602895
    
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
        telefono.text = restaurante.telefono
        tipo.text = restaurante.tipo
        imagen.sd_setImage(with: URL(string: restaurante.imagen))
        
        api = MapaApi()
        
        api.getMapa(placeid: restaurante.placeid) { (mapa) in
            self.lat = mapa.latitud
            self.long = mapa.longitud
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func Mapa(_ sender: Any) {
        
        //definiendo el destino
        
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long
        
        let regionDistance: CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)

        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = restaurante.nombre
        mapItem.openInMaps(launchOptions: options)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menu" {
            
            let destination = segue.destination as! MenuViewController
            
            destination.menu = restaurante.menu
        }
        else {
            if segue.identifier == "resena" {
                let destination = segue.destination as! ResenaViewController
                
                destination.resenaRes = restaurante.nombre
                destination.resenaId = restaurante.placeid
            }
        }
    }

    
    @IBAction func guardar(_ sender: Any) {
        
        let idUs = UserDefaults().object(forKey: "username") as? String
        let placeid = restaurante.placeid
        let nombre = restaurante.nombre
        let imagen = restaurante.imagen
        
        api1 = GuardarApi()
        
        api1.addGuardar(idUs: idUs!, placeid: placeid, nombre: nombre, imagen: imagen) { (guardar) in
            
        }
        
    }
    
    @IBAction func estuve(_ sender: Any) {
        let idUs = UserDefaults().object(forKey: "username") as? String
        let placeid = restaurante.placeid
        let nombre = restaurante.nombre
        let imagen = restaurante.imagen
        
        api2 = EstuveApi()
        
        api2.addEstuve(idUs: idUs!, placeid: placeid, nombre: nombre, imagen: imagen) { (estuve) in
            
        }
    }
}
