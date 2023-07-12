//
//  ForecastStackView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 12/07/2023.
//

import UIKit

protocol ForecastStackViewInput {
    func update(with model: WeatherForecastResponse)
}

class ForecastStackView: UIStackView {
    // TODO: convert into CollectionView
    let leftStackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        return stackView
    }()
    
    let leftTopStackView: UIStackView = {
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
    
    let leftTopTempLabel: UILabel = {
        let label: UILabel = .create()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    let leftTopDateLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    let leftBottomStackView: UIStackView = {
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
    
    let leftBottomTempLabel: UILabel = {
        let label: UILabel = .create()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    let leftBottomDateLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    let rightStackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fill
        return stackView
    }()
    
    let rightTopStackView: UIStackView = {
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
    
    let rightTopTempLabel: UILabel = {
        let label: UILabel = .create()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    let rightTopDateLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    let rightBottomStackView: UIStackView = {
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
    
    let rightBottomTempLabel: UILabel = {
        let label: UILabel = .create()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 48, weight: .bold)
        return label
    }()
    
    let rightBottomDateLabel: UILabel = {
        let label: UILabel = .create()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Preparation

private extension ForecastStackView {
    func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        spacing = 20
        distribution = .fillEqually
        
        doLayout()
    }

    func doLayout() {
        addSubviews()
    }
    
    func addSubviews() {
        addArrangedSubviews(
            leftStackView,
            rightStackView
        )
        
        leftStackView.addArrangedSubviews(
            leftTopStackView,
            leftBottomStackView
        )
        
        leftTopStackView.addArrangedSubviews(
            leftTopTempLabel,
            leftTopDateLabel
        )
        
        leftBottomStackView.addArrangedSubviews(
            leftBottomTempLabel,
            leftBottomDateLabel
        )
        
        rightStackView.addArrangedSubviews(
            rightTopStackView,
            rightBottomStackView
        )
        
        rightTopStackView.addArrangedSubviews(
            rightTopTempLabel,
            rightTopDateLabel
        )
        
        rightBottomStackView.addArrangedSubviews(
            rightBottomTempLabel,
            rightBottomDateLabel
        )
    }
}

// MARK: - Input

extension ForecastStackView: ForecastStackViewInput {
    func update(with model: WeatherForecastResponse) {
        if model.list.count == 4 {
            let leftTopItem = model.list[0]
            let rightTopItem = model.list[1]
            let leftBottomItem = model.list[2]
            let rightBottomItem = model.list[3]
            
            leftTopTempLabel.text = String(format: "%.0f", leftTopItem.main.temp) + Constants.General.celsiusDegreeSymbol
            leftTopTempLabel.textColor = leftTopItem.main.temp.temperatureTextColor()
            leftTopDateLabel.text = leftTopItem.dtTxt.replacingOccurrences(of: " ", with: "\n")

            rightTopTempLabel.text = String(format: "%.0f", rightTopItem.main.temp) + Constants.General.celsiusDegreeSymbol
            rightTopTempLabel.textColor = rightTopItem.main.temp.temperatureTextColor()
            rightTopDateLabel.text = rightTopItem.dtTxt.replacingOccurrences(of: " ", with: "\n")

            leftBottomTempLabel.text = String(format: "%.0f", leftBottomItem.main.temp) + Constants.General.celsiusDegreeSymbol
            leftBottomTempLabel.textColor = leftBottomItem.main.temp.temperatureTextColor()
            leftBottomDateLabel.text = leftBottomItem.dtTxt.replacingOccurrences(of: " ", with: "\n")

            rightBottomTempLabel.text = String(format: "%.0f", rightBottomItem.main.temp) + Constants.General.celsiusDegreeSymbol
            rightBottomTempLabel.textColor = rightBottomItem.main.temp.temperatureTextColor()
            rightBottomDateLabel.text = rightBottomItem.dtTxt.replacingOccurrences(of: " ", with: "\n")
        }
    }
}
