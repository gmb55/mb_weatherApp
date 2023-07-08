//
//  UIStackView+addArrangedSubviews.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
