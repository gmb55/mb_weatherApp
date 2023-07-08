//
//  UINavigationController+viewController.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

extension UINavigationController {
    func viewController(before viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllers.lastIndex(of: viewController),
              viewControllerIndex > 0
        else { return nil }
        return viewControllers[viewControllerIndex - 1]
    }
}
