//
//  DesktopCoordinator.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import UIKit

final class DesktopCoordinator: Coordinator {
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
        showDesktop()
    }
}

// MARK: - Private Actions

private extension DesktopCoordinator {
    func showDesktop() {
        let desktopViewModel = prepareDesktopViewModel()
        let desktopViewController = DesktopViewController(viewModel: desktopViewModel)
        navigationController.setViewControllers([desktopViewController], animated: false)
    }
    
    func prepareDesktopViewModel() -> DefaultDesktopViewModel {
        let startDetailsScreen = Action<()> { [weak self] in
            self?.showDetailsCoordinator()
        }
        
        return DefaultDesktopViewModel(
            actions: DefaultDesktopViewModel.CoordinatorOutput(
                startDetailsScreen: startDetailsScreen
            )
        )
    }
}

// MARK: - Show Details Coordinator

private extension DesktopCoordinator {
    func showDetailsCoordinator() {
        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController)
        children.append(detailsCoordinator)
        detailsCoordinator.start()
    }
}
