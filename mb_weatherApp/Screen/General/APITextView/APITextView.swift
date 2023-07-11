//
//  APITextView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import UIKit

final class APITextView: View {
    let stackView: UIStackView = {
        let stackView: UIStackView = .create()
        stackView.axis = .vertical
        stackView.spacing = 6
        return stackView
    }()
    
    let textViewDescriptionLabel: UILabel = {
        let label: UILabel = .create()
        label.text = R.string.localizable.apiKey()
        label.textColor = R.color.raven()
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    let textView: UITextView = {
        let textView: UITextView = .create()
        textView.backgroundColor = R.color.ebonyClay()
        textView.textColor = R.color.raven()
        textView.layer.cornerRadius = 10
        textView.font = .systemFont(ofSize: 16, weight: .bold)
        textView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.tintColor = R.color.brightSun()
        textView.showsVerticalScrollIndicator = false
        textView.isScrollEnabled = false
        textView.sizeToFit()
        return textView
    }()
    
    let viewModel = APITextFieldViewModel()
    
    init() {
        super.init(frame: .zero)
        setup()
        bindTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Preparation

private extension APITextView {
    func setup() {
        doLayout()
    }

    func doLayout() {
        addSubviews()
        configureConstraints()
    }
    
    func addSubviews() {
        addSubviews(stackView)
        
        stackView.addArrangedSubviews(
            textViewDescriptionLabel,
            textView
        )
    }
    
    func configureConstraints() {
        stackView.expandToSuperview()
    }
    
    func bindTextView() {
        textView.rx.text.orEmpty
            .bind(to: viewModel.text)
            .disposed(by: disposeBag)
    }
}
