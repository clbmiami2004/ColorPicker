//
//  ColorWheel.swift
//  ColorPicker
//
//  Created by Lambda_School_Loaner_201 on 11/20/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

//@IBDesignable
class ColorWheel: UIControl {
    
    var color: UIColor = .white
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        let radius = frame.width / 2.0 //bounds.width is valid too.
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.black.cgColor
    }
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 1
        
        for y in stride(from: 0, to: bounds.maxY, by: size) {
            
            for x in stride(from: 0, to: bounds.maxX, by: size) {
                let color = self.color(for: CGPoint(x: x, y: y))
                let pixel = CGRect(x: x, y: y, width: size, height: size)
                
                color.set()
                UIRectFill(pixel)
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        //print("\(#function)")
        let touchPoint = touch.location(in: self)
        color = color(for: touchPoint)
        sendActions(for: [.touchDown, .valueChanged])
        
        
        return true
    }
    
    
    
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        //print("\(#function)")
        let touchPoint = touch.location(in: self)
        
        let radius: CGFloat = 1.0
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = touchPoint.y - center.y
        let dx = touchPoint.x - center.x
        let offset = CGPoint(x: dx / center.x, y: dy / center.y)
        let pointLength = sqrt(offset.x * offset.x + offset.y * offset.y)
        
        if bounds.contains(touchPoint) {
            color = color(for: touchPoint)
            //let actionArray: UIControl.Event = [.touchDragInside, .valueChanged]
            //sendActions(for: actionArray)
            sendActions(for: [.touchDragInside, .valueChanged])
        }else {
            sendActions(for: .touchDragOutside)
        }
        
        return true
    }
    
    
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        //print("\(#function)")
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else {return}
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            color = color(for: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])
        }else {
            sendActions(for: .touchUpOutside)
        }

    }
    
    
    
    
    override func cancelTracking(with event: UIEvent?) {
        //print("\(#function)")
        defer {
            super.cancelTracking(with: event)
        }
        
        sendActions(for: .touchCancel)
        
        
        

    }
    
    
    
    
    private func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let dy = location.y - center.y
        let dx = location.x - center.x
        
        let offset = CGPoint(x: dx / center.x, y: dy / center.y)
        
        let (hue, saturation) = Color.getHueSaturation(at: offset)
        
        return UIColor(hue: hue, saturation: saturation, brightness: 1.0, alpha: 1.0)
    }
}
