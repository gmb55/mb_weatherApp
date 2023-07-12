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

    func start(with model: DefaultDetailsViewModel.DetailsModel) {
        showDetails(with: model)
    }

    func start() {}
}

// MARK: - Private Actions

private extension DetailsCoordinator {
    func showDetails(with model: DefaultDetailsViewModel.DetailsModel) {
        let detailsViewModel = DefaultDetailsViewModel(
            apiProvider: APIProvider.shared,
            model: model
        )
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        navigationController.pushViewController(detailsViewController, animated: false)
    }
}
