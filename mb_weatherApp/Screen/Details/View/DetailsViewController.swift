//
//  DetailsViewController.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    // MARK: - Properties

    private let viewModel: DetailsViewModel

    private var detailsView: DetailsView {
        guard let detailsView = view as? DetailsView else {
            fatalError("View is not set to DetailsView")
        }
        return detailsView
    }

    // MARK: - Inits

    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func loadView() {
        view = DetailsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupRxObservers()
    }
}

// MARK: - RxObservers

private extension DetailsViewController {
    func setupRxObservers() {
    }
}
