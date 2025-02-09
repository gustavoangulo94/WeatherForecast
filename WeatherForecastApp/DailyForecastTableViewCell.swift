//
//  DailyForecastTableViewCell.swift
//  WeatherForecastApp
//
//  Created by Gustavo Angulo on 08/02/25.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {
    
    static let indentifier: String = "DailyForecastTableViewCell"
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [weekDayLabel,iconImageView,minTemperatureLabel,maxTemperatureLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 18, trailing: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    private lazy var weekDayLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.contrastLightColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var minTemperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.contrastLightColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var maxTemperatureLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = UIColor.contrastLightColor
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(weekDay: String?, icon: UIImage?, min: String?, max: String?){
        weekDayLabel.text = weekDay
        iconImageView.image = icon
        minTemperatureLabel.text = "min \(min ?? "")"
        maxTemperatureLabel.text = "max \(max ?? "")"
    }
    
    private func setupView(){
        backgroundColor = .clear
        selectionStyle = .none
        setHierarchy()
        setContraints()
    }
    
    private func setHierarchy(){
        contentView.addSubview(stackView)
    }
    
    private func setContraints(){
        stackView.setContraintsToParent(contentView)
        NSLayoutConstraint.activate([
            weekDayLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
        ])
    }
}

