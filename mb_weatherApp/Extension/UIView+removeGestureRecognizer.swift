//
//  UIView+removeGestureRecognizer.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 09/07/2023.
//

import UIKit

extension UIView {
    func removeGestureRecognizer(with name: String) {
        guard let gestureRecognizers = gestureRecognizers else { return }

        for gestureRecognizer in gestureRecognizers where gestureRecognizer.name == name {
            removeGestureRecognizer(gestureRecognizer)
        }
    }
}
