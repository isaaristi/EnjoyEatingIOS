//
//  Restaurante.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 17/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation

class Restaurante {
    
    var placeid: String
    var nombre: String
    var logo: String
    var imagen: String
    var direccion: String
    var telefono: String
    var menu: [Menu] = []
    var tipo: String
    
    init(placeid: String, nombre: String, logo: String, imagen: String, direccion: String, telefono: String, menu: [Menu], tipo: String){
        
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
