//
//  IncidenciasRepositorio.swift
//  Prueba
//
//  Created by Gabriel on 9/6/24.
//

import Foundation

struct Incidencia {
    let nombre: String
    let tipo: String
    let descripcion: String
}

class IncidenciaRepositorio {
    static let shared = IncidenciaRepositorio()
    
    private var incidencias: [Incidencia] = []
    
    private init() {}
    
    func agregarIncidencia(_ incidencia: Incidencia) {
        incidencias.append(incidencia)
    }
    
    func obtenerIncidencias() -> [Incidencia] {
        return incidencias
    }
}
