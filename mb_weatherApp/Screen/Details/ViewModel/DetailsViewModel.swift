//
//  DetailsViewModel.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import Foundation

protocol DetailsNavigation: AnyObject {}

protocol DetailsViewModelInput {}

protocol DetailsViewModelOutput {}

typealias DetailsViewModel = DetailsViewModelInput & DetailsViewModelOutput

final class DefaultDetailsViewModel: DetailsViewModel {
    // MARK: - Properties

    weak var navigation: DetailsNavigation?

    // MARK: - Inits

    init(navigation: DetailsNavigation) {
        self.navigation = navigation
    }
}
