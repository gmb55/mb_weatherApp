//
//  TriangleShape.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

class TriangleView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let referenceUnitWidth = rect.maxX / Constants.General.referenceUnit
        let referenceUnitHeight = rect.maxY / Constants.General.referenceUnit
        
        let rightTopPoint = CGPoint(
            x: rect.midX,
            y: rect.minY + 2 * referenceUnitHeight
        )
        let leftDownPoint = CGPoint(
            x: rect.minX + 2 * referenceUnitWidth,
            y: rect.midY
        )
        let rightDownPoint = CGPoint(x: rect.midX, y: rect.midY)
        
        path.move(to: rightTopPoint)
        path.addLine(to: leftDownPoint)
        path.addLine(to: rightDownPoint)
        path.close()
        
        R.color.brightSun()?.setFill()
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
