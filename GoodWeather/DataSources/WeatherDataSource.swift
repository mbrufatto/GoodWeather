//
//  WeatherDataSource.swift
//  GoodWeather
//
//  Created by Marcio Brufatto on 17/12/19.
//  Copyright © 2019 Marcio Brufatto. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSources: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "weatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(weatherListViewModel: WeatherListViewModel){
        self.weatherListViewModel = weatherListViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(self.cellIdentifier) not found")
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.cityNameLabel.text = weatherVM.name
        cell.temperatureLabel.text = weatherVM.currentTemperature.temperature.formatAsDegree
        
        return cell
    }
}
