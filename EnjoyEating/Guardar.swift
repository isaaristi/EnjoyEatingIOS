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
    var logo: String
    var imagen: String
    var direccion: String
    var telefono: String
    var menu: [Menu] = []
    var tipo: String
    
    init(idUs: String, placeid: String, nombre: String, logo: String, imagen: String, direccion: String, telefono: String, menu: [Menu], tipo: String ) {
        
        self.idUs = idUs
        self.placeid = placeid
        self.nombre = nombre
        self.logo = logo
        self.imagen = imagen
        self.direccion = direccion
        self.telefono = telefono
        self.menu = menu
        self.tipo = tipo
    }
}
