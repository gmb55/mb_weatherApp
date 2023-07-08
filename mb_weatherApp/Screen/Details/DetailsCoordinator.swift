//
//  DetailsCoordinator.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

final class DetailsCoordinator: Coordinator {
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
        showDetails()
    }
}

// MARK: - Private Actions

private extension DetailsCoordinator {
    func showDetails() {
        let detailsViewModel = DefaultDetailsViewModel(navigation: self)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        navigationController.pushViewController(detailsViewController, animated: false)
    }
}

// MARK: - Details Navigation

extension DetailsCoordinator: DetailsNavigation {}
