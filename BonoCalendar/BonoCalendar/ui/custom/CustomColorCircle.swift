//
//  CustomColorCircle.swift
//  BonoCalendar
//
//  Created by 알파카 on 2024/11/10.
//

import SwiftUI

class CustomColorCircle {
    
    func createFilledCircleImage(color: Color, diameter: CGFloat) -> Image? {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: diameter, height: diameter))
        let image = renderer.image { context in
            // 색상을 지정하여 원을 그립니다
            UIColor(color).setFill()
            let rect = CGRect(x: 0, y: 0, width: diameter, height: diameter)
            context.cgContext.fillEllipse(in: rect)
        }
        return Image(uiImage: image)
            .resizable()
    }
}
