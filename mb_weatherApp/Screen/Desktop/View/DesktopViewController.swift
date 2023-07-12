//
//  DesktopViewController.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

final class DesktopViewController: ViewController {
    // MARK: - Properties

    private let viewModel: DesktopViewModel

    private var desktopView: DesktopView {
        guard let desktopView = view as? DesktopView else {
            fatalError("View is not set to DesktopView")
         }
        return desktopView
    }

    // MARK: - Inits

    init(viewModel: DesktopViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    override func loadView() {
        view = DesktopView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        setupRxObservers()
        animateLogo()
        setupTapGesture()
    }
}

// MARK: - RxObservers

private extension DesktopViewController {
    func setupRxObservers() {
        bindAPIText()
        bindContinueButton()
        setupErrorObserver()
        setupShowLoaderOBserver()
    }
    
    func bindAPIText() {
        desktopView.apiTextView.viewModel.text
            .bind(to: viewModel.apiText)
            .disposed(by: disposeBag)
    }
    
    func bindContinueButton() {
        desktopView.continueButton.rx.tap
            .bind(to: viewModel.continueButtonTapped)
            .disposed(by: disposeBag)
    }
    
    func setupErrorObserver() {
        viewModel.errorObservable
            .subscribe(onNext: { [weak self] errorType in
                self?.handleError(errorType.message)
            })
            .disposed(by: disposeBag)
    }
    
    func setupShowLoaderOBserver() {
        viewModel.showLoader
            .subscribe(onNext: { [weak self] shouldShow in
                DispatchQueue.main.async {
                    self?.desktopView.updateLoader(isVisible: shouldShow)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private Actions

private extension DesktopViewController {
    func animateLogo() {
        let scaleTransform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        let transparentTransform = CGAffineTransform(scaleX: 1, y: 1).concatenating(CGAffineTransform(translationX: 0, y: 0.5))

        UIView.animate(withDuration: 1.5, delay: 0, options: [.autoreverse, .repeat]) {
            self.desktopView.logoView.transform = scaleTransform.concatenating(transparentTransform)
            self.desktopView.logoView.alpha = 0.3
        }
    }

    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func viewTapped() {
        desktopView.apiTextView.textView.endEditing(true)
    }
    
    func handleError(_ message: String) {
        self.showErrorAlert(message: message)
            .subscribe(onNext: {
                self.viewModel.setupRxObservers()
            })
            .disposed(by: self.disposeBag)
    }
}
