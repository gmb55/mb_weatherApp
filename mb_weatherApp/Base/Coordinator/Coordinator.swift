//
//  Coordinator.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
    func childDidFinish(child: Coordinator)
}

extension Coordinator {
    func childDidFinish(child: Coordinator) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        children.remove(at: index)
    }
}
