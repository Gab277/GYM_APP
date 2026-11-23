//
//  Mostrar_ViewController.swift
//  Prueba
//
//  Created by Gabriel on 8/6/24.
//

import UIKit

class Mostrar_ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

        override func viewDidLoad() {
            super.viewDidLoad()
            mostrarUsuarios()
        }

        func mostrarUsuarios() {
            let usuarios = UsuarioRepositorio.shared.obtenerUsuarios()
            var texto = ""
            for usuario in usuarios {
                texto += "Nombre: \(usuario.nombre)\n"
                texto += "Fecha de Nacimiento: \(usuario.fechaDeNacimiento)\n"
                texto += "DNI: \(usuario.dni)\n\n"
            }
            textView.text = texto
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
