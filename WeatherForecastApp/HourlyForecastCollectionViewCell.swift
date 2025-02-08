//
//  HourlyForecastCollectionViewCell.swift
//  WeatherForecastApp
//
//  Created by Gustavo Angulo on 08/02/25.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let indentifier: String = "HourlyForecast"
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "13:00"
        label.textColor = UIColor.contrastLightColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "25°C"
        label.textColor = UIColor.contrastLightColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imagemView = UIImageView(frame: .zero)
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        imagemView.image = UIImage(named: "sunIcon")
        imagemView.contentMode = .scaleAspectFit
        return imagemView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView(){
        setHierarchy()
        setContraints()
    }
    
    private func setHierarchy(){
        
    }
    
    private func setContraints(){
        
    }
    
}
