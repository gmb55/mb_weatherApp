//
//  UIView+expandToSuperview.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import UIKit

extension UIView {
    func expandToSuperview(with constant: CGFloat = 0) {
        guard superview != nil else { return }
        snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: constant, left: constant, bottom: constant, right: constant))
        }
    }
    
    func expandToSuperviewSafearea(
        with constant: CGFloat = 0,
        withoutTopSafeArea: Bool = false,
        withoutBottomSafeArea: Bool = false
    ) {
        guard let superview = superview else { return }
        snp.makeConstraints { make in
            make.top.equalTo(withoutTopSafeArea ? superview.top : superview.safeAreaTop).inset(constant)
            make.leading.equalTo(superview.safeAreaLeading).inset(constant)
            make.trailing.equalTo(superview.safeAreaTrailing).inset(constant)
            make.bottom.equalTo(withoutBottomSafeArea ? superview.bottom : superview.safeAreaBottom).inset(constant)
        }
    }
}
