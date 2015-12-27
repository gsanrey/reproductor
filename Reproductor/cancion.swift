//
//  cancion.swift
//  Reproductor
//
//  Created by Gabriel Urso Santana Reyes on 27/12/15.
//  Copyright © 2015 Gabriel Urso Santana Reyes. All rights reserved.
//

import Foundation

class Cancion{
    var titulo : String? = ""
    var fichero : String = ""
    var portada : String = ""
    init(titulo: String, fichero : String, portada : String){
        self.titulo = titulo
        self.fichero = fichero
        self.portada = portada
    }
}
