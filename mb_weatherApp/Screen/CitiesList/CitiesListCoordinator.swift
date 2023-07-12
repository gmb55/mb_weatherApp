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

    func start(with apiKey: String) {
        showCitiesList(with: apiKey)
    }
    
    func start() {}
}

// MARK: - Private Actions

private extension CitiesListCoordinator {
    func showCitiesList(with apiKey: String) {
        let viewModel = prepareCitiesListViewModel(with: apiKey)
        let viewController = CitiesListViewController(viewModel: viewModel)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func prepareCitiesListViewModel(with apiKey: String) -> DefaultCitiesListViewModel {
        let startDetailsScreen = Action<DefaultDetailsViewModel.DetailsModel> { [weak self] model in
            self?.showDetailsCoordinator(with: model)
        }
        
        return DefaultCitiesListViewModel(
            apiKey: apiKey,
            actions: DefaultCitiesListViewModel.CoordinatorOutput(startDetailsScreen: startDetailsScreen)
        )
    }
}

// MARK: - Show Details Coordinator

private extension CitiesListCoordinator {
    func showDetailsCoordinator(with model: DefaultDetailsViewModel.DetailsModel) {
        let coordinator = DetailsCoordinator(navigationController: navigationController)
        children.append(coordinator)
        coordinator.start(with: model)
    }
}
