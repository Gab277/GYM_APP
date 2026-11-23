//
//  VerIncidencias_ViewController.swift
//  Prueba
//
//  Created by Gabriel on 9/6/24.
//

import UIKit

class VerIncidencias_ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

        override func viewDidLoad() {
            super.viewDidLoad()
            mostrarIncidencias()
        }

        func mostrarIncidencias() {
            let incidencia = IncidenciaRepositorio.shared.obtenerIncidencias()
            var texto = ""
            for incidencia in incidencia {
                texto += "Creado por: \(incidencia.nombre)\n"
                texto += "Tipo de Incidencia: \(incidencia.tipo)\n"
                texto += "Descripcion: \(incidencia.descripcion)\n\n"
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
