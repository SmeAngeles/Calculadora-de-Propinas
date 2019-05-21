//
//  CalculadoraVC.swift
//  Calculadora de Propinas
//
//  Created by Esmeralda Angeles on 5/21/19.
//  Copyright © 2019 Sme.Angeles. All rights reserved.
//

import UIKit

class CalculadoraVC: UIViewController {

    @IBOutlet weak var tfMontoFactura: UITextField!
    @IBOutlet weak var lblPropina: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var btn20: UIButton!
    @IBOutlet weak var btn15: UIButton!
    @IBOutlet weak var btn10: UIButton!
    
    var porcentaje: Float = 0
    var arrButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrButtons = [btn20,btn15,btn10]

    }
    
    func showAlert(titulo:String ,mensaje: String ){
        let alert =  UIAlertController(title: titulo, message: mensaje, preferredStyle: UIAlertController.Style.alert)
        let ok =  UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
        
    }
    
    func validaCampos()-> Bool{
        var valido = true
        if tfMontoFactura.text!.isEmpty{
            showAlert(titulo: "Ups", mensaje: "Introduce el monto de la factura.")
            valido = false
        }
        return valido
    }
    
    @IBAction func acButtonTapped(_ sender: UIButton) {
        for btn in arrButtons{
            (btn.tag == sender.tag) ?  (btn.isSelected = true) : (btn.isSelected = false)
        }
        porcentaje = Float(sender.tag) / 100
    }
    
    
    @IBAction func actCalcular(_ sender: Any) {
        let valido = validaCampos()
        if valido{
            let factura = Float(tfMontoFactura.text!)!
            
            let propina = factura * porcentaje
            
            let total = factura + propina
            
            lblPropina.text = "$\(propina)"
            lblTotal.text = "$\(total)"
        }
    }
    
}
