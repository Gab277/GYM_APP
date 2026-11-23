//
//  Registro_ViewController.swift
//  Prueba
//
//  Created by Gabriel on 8/6/24.
//

import UIKit

class Registro_ViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var fechaDeNacimientoTextField: UITextField!
    @IBOutlet weak var dniTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registrarButton(_ sender: UIButton) {
        
        print("Hola que tal")
        guard let nombre = nombreTextField.text, !nombre.isEmpty,
              let fechaDeNacimiento = fechaDeNacimientoTextField.text, !fechaDeNacimiento.isEmpty,
              let dni = dniTextField.text, !dni.isEmpty else {
            // Muestra una alerta si los campos están vacíos
            mostrarAlerta("Todos los campos son obligatorios. Por favor rellene todos los campos")
            return
        }

        let usuario = Usuario(nombre: nombre, fechaDeNacimiento: fechaDeNacimiento, dni: dni)
        UsuarioRepositorio.shared.agregarUsuario(usuario)
        
        // Muestra un mensaje de éxito
        mostrarAlerta("Usuario registrado correctamente.")
        
        // Limpia los campos de texto
        nombreTextField.text = ""
        fechaDeNacimientoTextField.text = ""
        dniTextField.text = ""
        }

        func mostrarAlerta(_ mensaje: String) {
            let alerta = UIAlertController(title: nil, message: mensaje, preferredStyle: .alert)
            alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alerta, animated: true, completion: nil)
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
