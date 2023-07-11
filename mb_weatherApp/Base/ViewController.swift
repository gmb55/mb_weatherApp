//
//  ViewController.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.color.woodsmoke()
    }
    
    func showErrorAlert(message: String) -> Observable<Void> {
        return Observable.create { [weak self] observer in
            let alertController = UIAlertController(title: R.string.localizable.error(), message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: R.string.localizable.ok(), style: .default) { _ in
                observer.onNext(())
                observer.onCompleted()
            }
            alertController.addAction(okAction)
            self?.present(alertController, animated: true, completion: nil)
            
            return Disposables.create {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
}
