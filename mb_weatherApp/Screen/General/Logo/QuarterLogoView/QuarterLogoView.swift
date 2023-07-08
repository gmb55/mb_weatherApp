//
//  QuarterLogoView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import SnapKit

class QuarterLogoView: UIView {
    private let quarterCircleView = QuarterCircleView()
    private let triangleView = TriangleView()
    private let squareShapeView = SquareShapeView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        doLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        doLayout()
    }
}

// MARK: - Private Actions

private extension QuarterLogoView {
    func doLayout() {
        addSubviews()
        configureConstraints()
    }

    func addSubviews() {
        addSubviews(
            quarterCircleView,
            triangleView,
            squareShapeView
        )
    }

    func configureConstraints() {
        [
            quarterCircleView,
            triangleView,
            squareShapeView,
        ].forEach {
            $0.expandToSuperview()
        }
    }
}
