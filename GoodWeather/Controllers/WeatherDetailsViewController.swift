//
//  WeatherDetailsViewController.swift
//  GoodWeather
//
//  Created by Marcio Brufatto on 17/12/19.
//  Copyright © 2019 Marcio Brufatto. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    private func setupViewModelBindings() {
        
        if let weatherViewModel = self.weatherViewModel {
            weatherViewModel.name.bind { self.cityNameLabel.text = $0 }
            weatherViewModel.currentTemperature.temperature.bind { self.currentTemperatureLabel.text = $0.formatAsDegree }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
        }
    }
}
