//
//  SquareShapeView.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

class SquareShapeView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let referenceUnitWidth = rect.maxX / Constants.General.referenceUnit
        let referenceUnitHeight = rect.maxY / Constants.General.referenceUnit
        
        let bottomPoint = CGPoint(
            x: rect.minX + 6.5 * referenceUnitWidth,
            y: rect.midY - 0.5 * referenceUnitHeight
        )
        let leftPoint = CGPoint(
            x: rect.minX + 5 * referenceUnitWidth,
            y: rect.midY - 2 * referenceUnitHeight
        )
        let topPoint = CGPoint(
            x: rect.minX + 6.5 * referenceUnitWidth,
            y: rect.midY - 3.5 * referenceUnitHeight
        )
        let rightPoint = CGPoint(
            x: rect.minX + 8 * referenceUnitWidth,
            y: rect.midY - 2 * referenceUnitHeight
        )
        
        path.move(to: bottomPoint)
        path.addLine(to: leftPoint)
        path.addLine(to: topPoint)
        path.addLine(to: rightPoint)
        path.close()
        
        R.color.ebonyClay()?.setFill()
        path.fill()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }
}
