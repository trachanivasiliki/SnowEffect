//
//  SnowEffectLayer.swift
//  SnowEffect
//
//  Created by Vasiliki Trachani on 2/1/21.
//

import UIKit

class SnowEffectLayer: CALayer {
    var effectImage: UIImage?
    var yAcceleration: CGFloat = 0.0
    let snowLayer = CAEmitterLayer()
    
    /// Insert snow animation to any view
    func injectSnowLayer(into view: UIView) {
        snowLayer.emitterPosition = CGPoint(x: view.bounds.width / 2.0, y: -50)
        snowLayer.emitterSize = CGSize(width: view.bounds.width, height: 0)
        snowLayer.emitterShape = .line
        snowLayer.beginTime = CACurrentMediaTime()
        snowLayer.timeOffset = CFTimeInterval(arc4random_uniform(6) + 5)
        let near = createEmitterCell(color: UIColor(white: 1, alpha: 1), velocity: -30, scale: 0.3, yAcceleration: yAcceleration)
        let middle = createEmitterCell(color: UIColor(white: 1, alpha: 0.66), velocity: 0, scale: 0.2, yAcceleration: yAcceleration)
        let far = createEmitterCell(color: UIColor(white: 1, alpha: 0.33), velocity: -30, scale: 0.1, yAcceleration: yAcceleration)

        snowLayer.emitterCells = [near, middle, far]
        view.layer.addSublayer(snowLayer)
    }
    
    func createEmitterCell(color: UIColor, velocity: CGFloat, scale: CGFloat, yAcceleration: CGFloat) -> CAEmitterCell {
        let emitterCell = CAEmitterCell()
        
        emitterCell.birthRate = 10
        emitterCell.lifetime = 20.0
        emitterCell.lifetimeRange = 0
        emitterCell.color = color.cgColor
        emitterCell.velocity = velocity
        emitterCell.velocityRange = -10
        emitterCell.emissionLongitude = .pi
        emitterCell.emissionRange = .pi / 8
        emitterCell.yAcceleration = yAcceleration
        emitterCell.scale = scale
        emitterCell.scaleRange = scale / 3
        emitterCell.contents = effectImage?.cgImage
        return emitterCell
        
    }
    
    /// Stop snow animation
    func removeSnowLayer(from view: UIView) {
        view.layer.removeFromSuperlayer()
    }
}
