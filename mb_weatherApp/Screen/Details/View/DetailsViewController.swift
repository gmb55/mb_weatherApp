//
//  DetailsViewController.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

final class DetailsViewController: ViewController {
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
        setupErrorObserver()
        setupShowLoaderOBserver()
        setupDataModelObserver()
    }
    
    func setupErrorObserver() {
        viewModel.errorObservable
            .subscribe(onNext: { [weak self] errorType in
                DispatchQueue.main.async {
                    self?.handleError(errorType.message)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func setupShowLoaderOBserver() {
        viewModel.showLoader
            .subscribe(onNext: { [weak self] shouldShow in
                DispatchQueue.main.async {
                    self?.detailsView.updateLoader(isVisible: shouldShow)
                }
            })
            .disposed(by: disposeBag)
    }
    
    func setupDataModelObserver() {
        viewModel.dataModel
            .subscribe(onNext: { [weak self] model in
                DispatchQueue.main.async {
                    self?.detailsView.update(with: model)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private Actions

private extension DetailsViewController {
    func handleError(_ message: String) {
        showErrorAlert(message: message)
            .subscribe(onNext: {
                self.viewModel.setupRxObservers()
            })
            .disposed(by: self.disposeBag)
    }
}
