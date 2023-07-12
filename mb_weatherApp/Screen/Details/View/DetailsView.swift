//
//  DetailsView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

protocol DetailsViewInputs {
    func updateLoader(isVisible: Bool)
    func update(with model: DefaultDetailsViewModel.DetailsDataModel)
}

final class DetailsView: UIView {
    let scrollView: UIScrollView = {
        let scrollView: UIScrollView = .create()
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 32, left: 20, bottom: 20, right: 20)
        stackView.distribution = .fill
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    // TODO: make new Component
    let mainWeatherStackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let temperaturePressureStackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = R.color.raven()?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    let todayTempLabel: UILabel = {
        let label: UILabel = .create()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    // TODO: make new Component
    let iconDespriptionStackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = R.color.raven()?.cgColor
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    let imageContainerView = UIView()
    let imageView: UIImageView = {
        let imageView: UIImageView = .create()
        return imageView
    }()
    
    let descriptionLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    let forecastStackView = ForecastStackView()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = R.color.raven()
        activityIndicatorView.backgroundColor = R.color.ebonyClay()?.withAlphaComponent(0.5)
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Preparation

private extension DetailsView {
    func setup() {
        doLayout()
    }

    func doLayout() {
        addSubviews()
        configureConstraints()
    }
    
    func addSubviews() {
        addSubviews(scrollView, activityIndicatorView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubviews(
            titleLabel,
            mainWeatherStackView,
            forecastStackView,
            UIView()
        )
        
        mainWeatherStackView.addArrangedSubviews(
            temperaturePressureStackView,
            iconDespriptionStackView
        )
        
        temperaturePressureStackView.addArrangedSubviews(
            todayTempLabel,
            pressureLabel
        )
        
        iconDespriptionStackView.addArrangedSubviews(
            imageContainerView,
            descriptionLabel
        )
        
        imageContainerView.addSubview(imageView)
    }

    func configureConstraints() {
        activityIndicatorView.expandToSuperview()
        
        scrollView.expandToSuperviewSafearea()
        
        stackView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.center.equalToSuperview()
        }
    }
}

// MARK: - Inputs

extension DetailsView: DetailsViewInputs {
    func updateLoader(isVisible: Bool) {
        isVisible
            ? activityIndicatorView.startAnimating()
            : activityIndicatorView.stopAnimating()
    }
    
    func update(with model: DefaultDetailsViewModel.DetailsDataModel) {
        updateWeather(with: model.weather)
        updateForecast(with: model.forecast)
    }
}

// MARK: - Private Actions

private extension DetailsView {
    func updateWeather(with model: WeatherResponse) {
        let todayTemperature = model.main.temp
        
        titleLabel.text = model.name
        todayTempLabel.text = String(format: "%.0f", todayTemperature) + Constants.General.celsiusDegreeSymbol
        todayTempLabel.textColor = todayTemperature.temperatureTextColor()
        pressureLabel.text = String(model.main.pressure) + Constants.General.hPa
        
        let weatherMain = model.weather.first?.main ?? ""
        let weatherType = WeatherType(rawValue: weatherMain)
        
        imageView.image = weatherType?.icon
        descriptionLabel.text = weatherType?.description
    }
    
    func updateForecast(with model: WeatherForecastResponse) {
        forecastStackView.update(with: model)
    }
}
