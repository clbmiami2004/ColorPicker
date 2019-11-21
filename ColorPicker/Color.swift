//
//  Color.swift
//  ColorPicker
//
//  Created by Lambda_School_Loaner_201 on 11/20/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//


import UIKit

struct Color {
    static func getHueSaturation(at offset: CGPoint) -> (hue: CGFloat, saturation: CGFloat) {
        if offset == CGPoint.zero {
            return (hue: 0, saturation: 0)
        }else {
            let saturation = sqrt(offset.x * offset.x + offset.y * offset.y)
            
            var hue = acos(offset.x / saturation) / (2.0 * CGFloat.pi)
            
            if offset.y < 0 {
                hue = 1.0 - hue
            }
            
            return (hue: hue, saturation: saturation)
        }
    }
}
