//
//  Incidencias_ViewController.swift
//  Prueba
//
//  Created by Gabriel on 9/6/24.
//

import UIKit

class Incidencias_ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var descripcionTextView: UITextView!
    
    let tiposDeIncidencia = ["Maquinas", "Vestuarios", "Personal", "Clientes", "Otro"]
    var tipoSeleccionado: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        tipoSeleccionado = tiposDeIncidencia[0]
    }

    @IBAction func registrarButtonTapped(_ sender: UIButton) {
        guard let nombre = nombreTextField.text, !nombre.isEmpty,
              let descripcion = descripcionTextView.text, !descripcion.isEmpty,
              let tipo = tipoSeleccionado else {
            mostrarAlerta("Por favor, complete todos los campos.")
            return
        }
        
        let incidencia = Incidencia(nombre: nombre, tipo: tipo, descripcion: descripcion)
        IncidenciaRepositorio.shared.agregarIncidencia(incidencia)
        
        mostrarAlerta("Incidencia registrada exitosamente.")
        
        nombreTextField.text = ""
        descripcionTextView.text = ""
        pickerView.selectRow(0, inComponent: 0, animated: true)
        tipoSeleccionado = tiposDeIncidencia[0]
    }

    func mostrarAlerta(_ mensaje: String) {
        let alerta = UIAlertController(title: nil, message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tiposDeIncidencia.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tiposDeIncidencia[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipoSeleccionado = tiposDeIncidencia[row]
    }
}
