//
//  ViewController.swift
//  alcohol-or-gasoline
//
//  Created by Cesar Giupponi Paiva on 07/04/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldAlcoholPrice: UITextField!
    @IBOutlet weak var textFieldGasolinePrice: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: Any) {
        if let alcoholPrice = self.textFieldAlcoholPrice.text {
            if let gasolinePrice = self.textFieldGasolinePrice.text {
                let fieldsValidated = self.validateFields(alcoholPrice: alcoholPrice, gasolinePrice: gasolinePrice)
                if fieldsValidated {
                    let result = self.calculateBestPrice(alcoholPrice: alcoholPrice, gasolinePrice: gasolinePrice)
                    if result >= 0.7 {
                        labelResult.text = "Melhor utilizar gasolina"
                        self.setLabelVisible()
                    } else {
                        labelResult.text = "Melhor utilizar álcool"
                        self.setLabelVisible()
                    }
                } else {
                    labelResult.text = "Digite os preços para calcular"
                    self.setLabelVisible()
                }
            }
        }
    }
    
    func validateFields(alcoholPrice: String, gasolinePrice: String) -> Bool {
        var validated = true
        if alcoholPrice.isEmpty || gasolinePrice.isEmpty {
            validated = false
        }
        return validated
    }
    
    func calculateBestPrice(alcoholPrice: String, gasolinePrice: String) -> Double {
        var result = Double()
        if let alcoholPriceConverted = Double(alcoholPrice) {
            if let gasolinePriceConverted = Double(gasolinePrice) {
                result = (alcoholPriceConverted / gasolinePriceConverted)
            }
        }
        return result
    }
    
    func setLabelVisible() {
        self.labelResult.isHidden = false
    }
    
}

