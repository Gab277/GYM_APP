//
//  Eliminar_ViewController.swift
//  Prueba
//
//  Created by Gabriel on 8/6/24.
//

import UIKit

class Eliminar_ViewController: UIViewController {

    @IBOutlet weak var dniTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func eliminarUsuarioTapped(_ sender: UIButton) {
        guard let dni = dniTextField.text, !dni.isEmpty else {
            mostrarAlerta("Por favor, ingrese un DNI.")
            return
        }
        
        let eliminado = UsuarioRepositorio.shared.eliminarUsuarioPorDNI(dni)
        
        if eliminado {
            mostrarAlerta("Usuario eliminado exitosamente.")
            dniTextField.text = ""
        } else {
            mostrarAlerta("No se encontró un usuario con ese DNI.")
        }
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
