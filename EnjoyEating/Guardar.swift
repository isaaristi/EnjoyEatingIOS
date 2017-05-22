//
//  Guardar.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 21/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation

class Guardar {
    
    var idUs: String
    var placeid: String
    var nombre: String
    var imagen: String
    
    init(idUs: String, placeid: String, nombre: String,  imagen: String ) {
        
        self.idUs = idUs
        self.placeid = placeid
        self.nombre = nombre
        self.imagen = imagen
    }
}
