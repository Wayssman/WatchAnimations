//
//  CircleJump.swift
//  WatchAnimations WatchKit Extension
//
//  Created by Желанов Александр Валентинович on 30.10.2021.
//

import SwiftUI

struct CircleJumpView: View {
    
    struct LiquidCircles: Shape {
        var circlesOffset: CGFloat
        var animatableData: CGFloat {
            get { return circlesOffset }
            set { circlesOffset = newValue }
        }
        
        func path(in rect: CGRect) -> Path {
            var path = Path()
            let midX = rect.midX
            let midY = rect.midY
            
            path.addArc(center: CGPoint(x: midX / 2 + circlesOffset, y: midY / 2 + midY - circlesOffset), radius: rect.height / 4, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: circlesOffset > -3 ? 270 : 360), clockwise: false)
            
            if circlesOffset < 16 {
                path.addCurve(to: CGPoint(x: midX - circlesOffset, y: midY / 2 + circlesOffset), control1: CGPoint(x: midX - circlesOffset, y: midY - circlesOffset), control2: CGPoint(x: midX - circlesOffset, y: midY - circlesOffset))
            }
            
            path.addArc(center: CGPoint(x: midX + midX / 2 - circlesOffset, y: midY / 2 + circlesOffset), radius: rect.height / 4, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: circlesOffset > -3 ? 90 : 540), clockwise: false)
            
            if circlesOffset < 16 {
                path.addCurve(to: CGPoint(x: midX + circlesOffset, y: midY + midY / 2 - circlesOffset), control1: CGPoint(x: midX + circlesOffset, y: midY + circlesOffset), control2: CGPoint(x: midX + circlesOffset, y: midY + circlesOffset))
            }
            
            path.closeSubpath()
            
            return path
        }
    }
    
    private var liquidAnimation: Animation {
        Animation.easeOut(duration: 0.5)
            .repeatForever(autoreverses: true)
    }
    private var rotationAnimation: Animation {
        Animation.linear(duration: 8)
            .repeatForever(autoreverses: false)
    }
    
    @State private var oncoming: CGFloat = -2
    @State private var rotation = 0.0
    private var colors =
        [Color(red: 255 / 255, green: 173 / 255, blue: 173 / 255),
         Color(red: 255 / 255, green: 214 / 255, blue: 165 / 255),
         Color(red: 253 / 255, green: 255 / 255, blue: 182 / 255),
         Color(red: 202 / 255, green: 255 / 255, blue: 191 / 255),
         Color(red: 155 / 255, green: 246 / 255, blue: 255 / 255),
         Color(red: 160 / 255, green: 196 / 255, blue: 255 / 255),
         Color(red: 189 / 255, green: 178 / 255, blue: 255 / 255),
         Color(red: 255 / 255, green: 198 / 255, blue: 255 / 255),
         Color(red: 255 / 255, green: 255 / 255, blue: 252 / 255)]
    
    var body: some View {
        LiquidCircles(circlesOffset: oncoming)
            .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .frame(width: 130, height: 130)
            .animation(liquidAnimation)
            .rotationEffect(Angle(degrees: rotation))
            .animation(rotationAnimation)
            .onAppear {
                oncoming = 30
                rotation = 360
            }
    }
}

struct CircleJumpView_Previews: PreviewProvider {
    static var previews: some View {
        CircleJumpView()
            .frame(width: 100, height: 100)
    }
}
