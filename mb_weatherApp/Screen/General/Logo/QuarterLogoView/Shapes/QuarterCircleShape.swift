//
//  QuarterCircleShape.swift
//  mb_weatherApp
//
//  Created by Michał Bagrowski on 06/07/2023.
//

import UIKit

class QuarterCircleView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addArc(
            withCenter: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2,
            startAngle: CGFloat(Double.pi),
            endAngle: CGFloat(Double.pi * 1.5),
            clockwise: true
        )
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
    }
}
