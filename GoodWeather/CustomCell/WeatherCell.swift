//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Marcio Brufatto on 12/12/19.
//  Copyright © 2019 Marcio Brufatto. All rights reserved.
//

import Foundation
import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ viewModel: WeatherViewModel) {
        
        self.cityNameLabel.text = viewModel.name.value
        self.temperatureLabel.text = "\(viewModel.currentTemperature.temperature.value.formatAsDegree)"
    }
}
