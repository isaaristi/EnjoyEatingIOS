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
    
    var lat: CLLocationDegrees = 2.452473
    var long: CLLocationDegrees = -76.602895
    
    @IBOutlet weak var tipo: UILabel!
    @IBOutlet weak var telefono: UILabel!
    @IBOutlet weak var direccion: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nombre.text = restaurante.nombre
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "menu" {
            
            let destination = segue.destination as! MenuViewController
            
            destination.menu = restaurante.menu
        }
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
