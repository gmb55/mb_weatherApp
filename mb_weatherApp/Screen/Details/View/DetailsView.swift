//
//  DetailsView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

final class DetailsView: UIView {
    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Private Actions

private extension DetailsView {
    func setup() {
        backgroundColor = .red
        doLayout()
    }

    func doLayout() {
    }
}
