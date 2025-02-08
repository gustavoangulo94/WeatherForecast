//
//  UIView+Extensions.swift
//  WeatherForecastApp
//
//  Created by Gustavo Angulo on 08/02/25.
//

import Foundation
import UIKit

extension UIView {
    func setContraintsToParent (_ parent: UIView){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
}
