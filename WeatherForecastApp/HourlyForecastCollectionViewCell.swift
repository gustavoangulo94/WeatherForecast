//
//  HourlyForecastCollectionViewCell.swift
//  WeatherForecastApp
//
//  Created by Gustavo Angulo on 08/02/25.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let indentifier: String = "HourlyForecast"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel,iconImageView,temperatureLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.layer.borderWidth = 1
        stackView.layer.cornerRadius = 20
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layer.borderColor = UIColor.contrastLightColor?.cgColor
        
        
        return stackView
    }()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.contrastLightColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.contrastLightColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imagemView = UIImageView(frame: .zero)
        imagemView.translatesAutoresizingMaskIntoConstraints = false
        imagemView.contentMode = .scaleAspectFit
        return imagemView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func loadData(time: String?, icon: UIImage?, temp: String?){
        hourLabel.text = time
        iconImageView.image = icon
        temperatureLabel.text = temp
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        setHierarchy()
        setContraints()
    }
    
    private func setHierarchy(){
        contentView.addSubview(stackView)
        
    }
    
    private func setContraints(){
        stackView.setContraintsToParent(contentView)
        NSLayoutConstraint.activate([
           iconImageView.heightAnchor.constraint(equalToConstant: 31)
        ])
    }
    
}
