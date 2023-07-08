//
//  UIView+create.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import UIKit

extension UIView {
    static func create<ViewType: UIView>() -> ViewType {
        let view = ViewType()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
