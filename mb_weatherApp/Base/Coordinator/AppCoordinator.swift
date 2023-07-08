//
//  AppCoordinator.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    // MARK: - Properties

    weak var parentCoordinator: Coordinator?
    var children = [Coordinator]()
    var navigationController: UINavigationController

    // MARK: - Inits

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Methods

    func start() {
        showDesktopCoordinator()
    }
}

// MARK: - Show Details Coordinator

private extension AppCoordinator {
    func showDesktopCoordinator() {
        let desktopCoordinator = DesktopCoordinator(navigationController: navigationController)
        children.append(desktopCoordinator)
        desktopCoordinator.start()
    }
}
