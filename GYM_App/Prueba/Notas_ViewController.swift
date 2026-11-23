//
//  Notas_ViewController.swift
//  Prueba
//
//  Created by Gabriel on 10/6/24.
//

import UIKit

class Notas_ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var NotasTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotasTextView.delegate = self
        
        
        if let savedText = UserDefaults.standard.string(forKey: "savedText") {
            NotasTextView.text = savedText
        }
    }
    
    @objc func textViewDidBeginEditing(_ textView: UITextView) {
            // El teclado se desplegará automáticamente
        }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            // Guardar el texto del UITextView en UserDefaults
            UserDefaults.standard.set(NotasTextView.text, forKey: "savedText")
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
