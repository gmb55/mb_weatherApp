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
        let viewModel = prepareViewModel()
        let viewController = DesktopViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func prepareViewModel() -> DefaultDesktopViewModel {
        let startCitiesListScreen = Action<String> { [weak self] apiKey in
            self?.showCitiesListCoordinator(with: apiKey)
        }
        
        return DefaultDesktopViewModel(
            apiProvider: APIProvider.shared,
            actions: DefaultDesktopViewModel.CoordinatorOutput(
                startCitiesListScreen: startCitiesListScreen
            )
        )
    }
}

// MARK: - Show Details Coordinator

private extension DesktopCoordinator {
    func showCitiesListCoordinator(with apiKey: String) {
        let coordinator = CitiesListCoordinator(navigationController: navigationController)
        children.append(coordinator)
        coordinator.start(with: apiKey)
    }
}
