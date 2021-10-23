//
//  ContentView.swift
//  WatchAnimations WatchKit Extension
//
//  Created by Желанов Александр Валентинович on 23.10.2021.
//

import SwiftUI

struct RectanglePyramidsView: View {
    @State private var isAnimating = false
    @State private var scale1: CGFloat = 1.0
    @State private var scale2: CGFloat = 1.0
    @State private var scale3: CGFloat = 1.0
    @State private var scale4: CGFloat = 1.0
    @State private var angle: Double = 0.0
    @State private var colorChanger = true
    
    private var color1 = Color(red: 115 / 255.0, green: 40 / 255.0, blue: 174 / 255.0, opacity: 1.0)
    private var color2 = Color(red: 121 / 255.0, green: 42 / 255.0, blue: 189 / 255.0, opacity: 1.0)
    private var color3 = Color(red: 127 / 255.0, green: 44 / 255.0, blue: 203 / 255.0, opacity: 1.0)
    private var color4 = Color(red: 159 / 255.0, green: 66 / 255.0, blue: 211 / 255.0, opacity: 1.0)
    private var color5 = Color(red: 191 / 255.0, green: 88 / 255.0, blue: 218 / 255.0, opacity: 1.0)
    private var color6 = Color(red: 223 / 255.0, green: 110 / 255.0, blue: 225 / 255.0, opacity: 1.0)
    private var color7 = Color(red: 239 / 255.0, green: 129 / 255.0, blue: 229 / 255.0, opacity: 1.0)
    private var color8 = Color(red: 255 / 255.0, green: 132 / 255.0, blue: 232 / 255.0, opacity: 1.0)
    
    
    var scaleAnimation1: Animation {
        Animation.linear(duration: 0.9)
            .repeatForever(autoreverses: true)
    }
    var scaleAnimation2: Animation {
        Animation.linear(duration: 0.7)
            .repeatForever(autoreverses: true)
    }
    var scaleAnimation3: Animation {
        Animation.linear(duration: 1.0)
            .repeatForever(autoreverses: true)
    }
    var scaleAnimation4: Animation {
        Animation.linear(duration: 0.7)
            .repeatForever(autoreverses: true)
    }
    
    var rotationAnimation: Animation {
        Animation.linear(duration: 4.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorChanger ? color1 : color2)
                .frame(width: 120, height: 120, alignment: .center)
                .cornerRadius(20)
                .scaleEffect(scale1)
                .animation(scaleAnimation1)
                .onAppear {
                    scale1 = 0.6
                    colorChanger.toggle()
                }
            
            Rectangle()
                .fill(colorChanger ? color4 : color3)
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(18)
                .rotationEffect(Angle(degrees: 34.0))
                .scaleEffect(scale2)
                .animation(scaleAnimation2)
                .onAppear() {
                    scale2 = 0.7
                }
            
            Rectangle()
                .fill(colorChanger ? color5 : color6)
                .frame(width: 80, height: 80, alignment: .center)
                .cornerRadius(16)
                .rotationEffect(Angle.degrees(68.0))
                .scaleEffect(scale3)
                .animation(scaleAnimation3)
                .onAppear() {
                    scale3 = 0.7
                }
            
            Rectangle()
                .fill(colorChanger ? color7 : color8)
                .frame(width: 60, height: 60, alignment: .center)
                .cornerRadius(14)
                .rotationEffect(Angle.degrees(130.0))
                .scaleEffect(scale4)
                .animation(scaleAnimation4)
                .onAppear() {
                    scale4 = 0.8
                }
        }
        .rotationEffect(Angle.degrees(angle))
        .rotation3DEffect(
            Angle(degrees: 40.0),
            axis: (1.0, 0.0, 0.0)
        )
        .animation(rotationAnimation)
        .onAppear() {
            angle = 360.0
        }
    }
}

struct RectanglePyramidsView_Previews: PreviewProvider {
    static var previews: some View {
        RectanglePyramidsView()
    }
}
