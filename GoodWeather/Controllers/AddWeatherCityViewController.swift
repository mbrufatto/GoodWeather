//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Marcio Brufatto on 12/12/19.
//  Copyright © 2019 Marcio Brufatto. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        
        if let city = cityNameTextField.text {
            
            let newCity = city.replacingOccurrences(of: " ", with: "%20")
            
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(newCity)&APPID=9778d49f22fddbce71692a9a024b3e2b&units=imperial")!
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                if let weatherViewModel = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(viewModel: weatherViewModel)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
                
            }
        }
    }
    
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
