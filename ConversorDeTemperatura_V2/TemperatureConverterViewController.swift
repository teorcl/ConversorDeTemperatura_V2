//
//  TemperatureConverterViewController.swift
//  ConversorDeTemperatura_V2
//
//  Created by TEO on 22/11/22.
//

import UIKit

class TemperatureConverterViewController: UIViewController {
    
    private struct Const{
        static let offset: Double = 32.0
        static let conversionFactor: Double = 1.8
    }
    
    // MARK: -Outlets
    @IBOutlet weak var celciusTextField: UITextField!
    @IBOutlet weak var convertCelciusToFahrenheitButton: UIButton!
    @IBOutlet weak var resultCelciusToFahrenheitLabel: UILabel!
    
    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var convertFahrenheitToCelciusButton: UIButton!
    @IBOutlet weak var resultFahrenheitToCelciusLabel: UILabel!
    
    var celciusObtained: Double?
    var fahrenheitObtained: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    @IBAction func convertToCelciusButtonPressed(_ sender: Any) {
        convertToCelcius()
        setUpResultFahrenheitToCelciusLabel(celciusObtained: celciusObtained!)
    }
    
    private func convertToCelcius(){
        guard let fahrenheiInTextField = Double(getDataInTextField(dataInTextField: fahrenheitTextField.text)) else { return }
        celciusObtained = getCelcius(fahrenheit: fahrenheiInTextField)
    }
    
    private func getCelcius(fahrenheit: Double) -> Double{
        return (fahrenheit - Const.offset)/Const.conversionFactor
    }
    
    
    
    @IBAction func convertToFahrenheitButtonPressed(_ sender: Any) {
        convertToFahrenheit()
        setUpResultCelciusToFahrenheitLabel(fahrenheitObtained: fahrenheitObtained!)
    }
    
    private func convertToFahrenheit(){
        guard let celciusInTextField = Double(getDataInTextField(dataInTextField: celciusTextField.text)) else { return }
        fahrenheitObtained = getFahrenheit(celcius: celciusInTextField)
    }
    
    private func getFahrenheit(celcius: Double) -> Double{
        return (celcius*Const.conversionFactor)+Const.offset
    }
    
    private func getDataInTextField(dataInTextField: String?) -> String{
        let dataToReturn = dataInTextField ?? "0"
        return dataToReturn
    }

    private func setUpUI(){
        setUpConvertCelciusToFahrenheitButton()
        setUpConvertFahrenheitToCelciusButton()
    }
    
    private func setUpConvertCelciusToFahrenheitButton(){
        convertCelciusToFahrenheitButton.layer.cornerRadius = 12
        convertCelciusToFahrenheitButton.layer.borderWidth = 1
    }
    
    private func setUpConvertFahrenheitToCelciusButton(){
        convertFahrenheitToCelciusButton.layer.cornerRadius = 12
    }
    
    private func setUpResultCelciusToFahrenheitLabel(fahrenheitObtained: Double){
        resultCelciusToFahrenheitLabel.isHidden = false
        resultCelciusToFahrenheitLabel.text = "\(fahrenheitObtained) ºF"
    }
    
    private func setUpResultFahrenheitToCelciusLabel(celciusObtained: Double){
        resultFahrenheitToCelciusLabel.isHidden = false
        resultFahrenheitToCelciusLabel.text = "\(celciusObtained) ºC"
    }

}

