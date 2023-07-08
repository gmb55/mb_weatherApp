//
//  UIView+addSubviews.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
