//
//  LogoView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

class LogoView: UIView {
    private let quarterLogoView1 = QuarterLogoView()
    private let quarterLogoView2: QuarterLogoView = {
        let mirroredView = QuarterLogoView()
        mirroredView.transform = CGAffineTransform(scaleX: -1, y: 1)
        return mirroredView
    }()
    private let quarterLogoView3: QuarterLogoView = {
        let mirroredView = QuarterLogoView()
        mirroredView.transform = CGAffineTransform(scaleX: 1, y: -1)
        return mirroredView
    }()
    private let quarterLogoView4: QuarterLogoView = {
        let mirroredView = QuarterLogoView()
        mirroredView.transform = CGAffineTransform(scaleX: -1, y: -1)
        return mirroredView
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Private Actions

private extension LogoView {
    func setup() {
        doLayout()
    }

    func doLayout() {
        addSubviews()
        configureConstraints()
    }

    func addSubviews() {
        addSubviews(
            quarterLogoView1,
            quarterLogoView2,
            quarterLogoView3,
            quarterLogoView4
        )
    }

    func configureConstraints() {
        [
            quarterLogoView1,
            quarterLogoView2,
            quarterLogoView3,
            quarterLogoView4,
        ].forEach {
            $0.expandToSuperview()
        }
    }
}
