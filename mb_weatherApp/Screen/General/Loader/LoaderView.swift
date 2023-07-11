//
//  LoaderView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import UIKit

final class LoaderView: View {
    let backgroundView: UIView = {
        let view: UIView = .create()
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()
    
    let loaderView: UIActivityIndicatorView = {
        let loaderView = UIActivityIndicatorView(style: .whiteLarge)
        loaderView.color = .white
        loaderView.startAnimating()
        return loaderView
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

private extension LoaderView {
    func setup() {
        doLayout()
    }

    func doLayout() {
        addSubviews()
        configureConstraints()
    }
    
    func addSubviews() {
        addSubviews(backgroundView)
        
        backgroundView.addSubview(loaderView)
    }
    
    func configureConstraints() {
        backgroundView.expandToSuperview()

        loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
