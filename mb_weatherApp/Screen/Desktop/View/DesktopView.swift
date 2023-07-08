//
//  DesktopView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import SnapKit

final class DesktopView: UIView {
    let scrollView: UIScrollView = {
        let scrollView: UIScrollView = .create()
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 32, left: 40, bottom: 20, right: 40)
        stackView.distribution = .fill
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label: UILabel = .create()
        label.text = R.string.localizable.appName()
        label.textColor = R.color.raven()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    let animationSpaceBox = UIView()
    
    let logoContainerView = UIView()
    let logoView = LogoView()
    
    let logInLabel: UILabel = {
        let label: UILabel = .create()
        label.text = R.string.localizable.logIn()
        label.textColor = R.color.raven()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    let apiTextView: APITextView = {
        let textView: APITextView = .create()
        return textView
    }()
    
    
    let continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.string.localizable.continue(), for: .normal)
        button.setTitleColor(R.color.woodsmoke(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = R.color.brightSun()
        button.layer.cornerRadius = 10
        return button
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

private extension DesktopView {
    func setup() {
        backgroundColor = R.color.woodsmoke()
        doLayout()
    }
    
    func doLayout() {
        addSubviews()
        configureConstraints()
    }

    func addSubviews() {
        addSubviews(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubviews(
            titleLabel,
            logoContainerView,
            animationSpaceBox,
            logInLabel,
            apiTextView,
            continueButton,
            UIView()
        )
        
        logoContainerView.addSubview(logoView)
    }

    func configureConstraints() {
        scrollView.expandToSuperviewSafearea()
        
        stackView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
        stackView.setCustomSpacing(40, after: logInLabel)
        stackView.setCustomSpacing(60, after: apiTextView)
        
        logoView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        animationSpaceBox.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        
        continueButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
}
