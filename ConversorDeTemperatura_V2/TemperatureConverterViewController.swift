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
        static let celcius = "ºC"
        static let fahrenheit = "ºF"
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
        setResultLabel(label: resultFahrenheitToCelciusLabel, result: celciusObtained!, typeOfTemperature: Const.celcius, hidden: false)
    }
    
    private func convertToCelcius(){
        let fahrenheiInTextField = getDataInTextField(dataInTextField: fahrenheitTextField.text)
        guard let fahrenheiInTextField = Double( fahrenheiInTextField ) else { return }
        celciusObtained = getCelcius(fahrenheit: fahrenheiInTextField)
    }
    
    private func getCelcius(fahrenheit: Double) -> Double{
        return (fahrenheit - Const.offset)/Const.conversionFactor
    }
    
    
    
    @IBAction func convertToFahrenheitButtonPressed(_ sender: Any) {
        convertToFahrenheit()
        setResultLabel(label: resultCelciusToFahrenheitLabel, result: fahrenheitObtained!, typeOfTemperature: Const.fahrenheit, hidden: false)
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
    
    private func setResultLabel(label: UILabel, result: Double, typeOfTemperature: String,hidden: Bool){
        label.isHidden = hidden
        label.text = "\(result) \(typeOfTemperature)"
    }

}

