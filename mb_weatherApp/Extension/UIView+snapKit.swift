//
//  UIView+snapKit.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 08/07/2023.
//

import SnapKit

extension UIView {
    var bottom: ConstraintItem {
        return snp.bottom
    }

    var top: ConstraintItem {
        return snp.top
    }

    var left: ConstraintItem {
        return snp.left
    }

    var right: ConstraintItem {
        return snp.right
    }

    var trailing: ConstraintItem {
        return snp.trailing
    }

    var leading: ConstraintItem {
        return snp.leading
    }

    var width: ConstraintItem {
        return snp.width
    }

    var height: ConstraintItem {
        return snp.height
    }

    var centerX: ConstraintItem {
        return snp.centerX
    }

    var centerY: ConstraintItem {
        return snp.centerY
    }

    var safeAreaTop: ConstraintItem {
        return safeAreaLayoutGuide.snp.top
    }

    var safeAreaLeft: ConstraintItem {
        return safeAreaLayoutGuide.snp.left
    }

    var safeAreaRight: ConstraintItem {
        return safeAreaLayoutGuide.snp.right
    }

    var safeAreaLeading: ConstraintItem {
        return safeAreaLayoutGuide.snp.leading
    }

    var safeAreaTrailing: ConstraintItem {
        return safeAreaLayoutGuide.snp.trailing
    }

    var safeAreaBottom: ConstraintItem {
        return safeAreaLayoutGuide.snp.bottom
    }

    var safeAreaHeight: ConstraintItem {
        return safeAreaLayoutGuide.snp.height
    }
}
