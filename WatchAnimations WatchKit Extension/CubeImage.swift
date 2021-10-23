//
//  ContentView.swift
//  WatchAnimations WatchKit Extension
//
//  Created by Желанов Александр Валентинович on 23.10.2021.
//

import SwiftUI

struct CubeImageView: View {
    @State private var shift = 0.0
    @State private var xOffset: CGFloat = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("eveningTexture")
                    .resizable()
                    .rotation3DEffect(
                        Angle(degrees: 90 + shift),
                        axis: (0.0, -1.0, 0.0),
                        anchor: UnitPoint.trailing
                    )
                    .zIndex(0)
                    .offset(x: xOffset, y: 0.0)
                
                Form {
                    Section() {
                        ZStack(alignment: .center) {
                            Image("eveningTexture")
                                .resizable()
                                .frame(width: 50, height: 30)
                                .cornerRadius(5)
                            Text("Sky1")
                                .offset(x: 60, y: 0)
                        }
                        ZStack(alignment: .center) {
                            Image("skyTexture")
                                .resizable()
                                .frame(width: 50, height: 30)
                                .cornerRadius(5)
                            Text("Sky2")
                                .offset(x: 60, y: 0)
                        }
                        ZStack(alignment: .center) {
                            Image("waterTexture")
                                .resizable()
                                .frame(width: 50, height: 30)
                                .cornerRadius(5)
                            Text("Water")
                                .offset(x: 60, y: 0)
                        }
                        ZStack(alignment: .center) {
                            Image("grassTexture")
                                .resizable()
                                .frame(width: 50, height: 30)
                                .cornerRadius(5)
                            Text("Grass")
                                .offset(x: 60, y: 0)
                        }
                    }
                }
                .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .rotation3DEffect(
                    Angle(degrees: 0 + shift),
                    axis: (0.0, -1.0, 0.0),
                    anchor: UnitPoint.trailing
                )
                .zIndex(0)
                .offset(x: xOffset, y: 0.0)
            }
            .animation(
                .linear(duration: 1)
                    .delay(1)
                    .repeatForever(autoreverses: true)
            )
            .onAppear{
                shift = 90.0
                xOffset = -WKInterfaceDevice.current().screenBounds.width
            }
        }
        
        .navigationTitle("Textures")
    }
}

struct CubeImageView_Previews: PreviewProvider {
    static var previews: some View {
        CubeImageView()
    }
}
