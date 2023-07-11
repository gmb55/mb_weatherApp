//
//  CitiesListCoordinator.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 10/07/2023.
//
import UIKit

final class CitiesListCoordinator: Coordinator {
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
        showCitiesList()
    }
}

// MARK: - Private Actions

private extension CitiesListCoordinator {
    func showCitiesList() {
        let viewModel = prepareCitiesListViewModel()
        let viewController = CitiesListViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func prepareCitiesListViewModel() -> DefaultCitiesListViewModel {
        let startDetailsScreen = Action<Int> { [weak self] id in
            self?.showDetailsCoordinator()
        }
        
        return DefaultCitiesListViewModel(
            actions: DefaultCitiesListViewModel.CoordinatorOutput(
                startDetailsScreen: startDetailsScreen
            )
        )
    }
}

// MARK: - Show Details Coordinator

private extension CitiesListCoordinator {
    func showDetailsCoordinator() {
        let coordinator = DetailsCoordinator(navigationController: navigationController)
        children.append(coordinator)
        coordinator.start()
    }
}
