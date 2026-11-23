//
//  UsuarioRepositorio.swift
//  Prueba
//
//  Created by Gabriel on 8/6/24.
//

import Foundation

struct Usuario {
    let nombre: String
    let fechaDeNacimiento: String
    let dni: String
}

class UsuarioRepositorio {
    static let shared = UsuarioRepositorio()
    
    private var usuarios: [Usuario] = []
    
    private init() {}
    
    func agregarUsuario(_ usuario: Usuario) {
        usuarios.append(usuario)
    }
    
    func obtenerUsuarios() -> [Usuario] {
        return usuarios
    }
    
    func eliminarUsuarioPorDNI(_ dni: String) -> Bool {
            if let index = usuarios.firstIndex(where: { $0.dni == dni }) {
                usuarios.remove(at: index)
                return true
            }
            return false
        }
}
