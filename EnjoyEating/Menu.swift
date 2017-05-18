//
//  Menu.swift
//  EnjoyEating
//
//  Created by Lina Isabel Aristizabal on 17/05/17.
//  Copyright © 2017 Lina Isabel Aristizabal. All rights reserved.
//

import Foundation

    class Menu {
        
        var nombre: String
        var precio: String
        var imagen: String
        var ingredientes: [String] = []
        
        init(nombre: String, precio: String, imagen: String, ingredientes: [String]) {
            
            self.nombre = nombre
            self.precio = precio
            self.imagen = imagen
            self.ingredientes = ingredientes
        }
}
