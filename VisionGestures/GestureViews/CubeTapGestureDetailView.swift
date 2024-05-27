//
//  CubeTapGestureDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI

struct CubeTapGestureDetailView: View {
    @State private  var color = Color.green
    private let colors = [Color.white, .red, .orange, .purple, .blue]
    @State private var count = 0
    @State private var textOpacity = 0.0
    
    var body: some View {
        ZStack {
            CubeView(color: color)
                .gesture(
                    TapGesture().targetedToAnyEntity()
                        .onEnded({ value in
                            count += 1
                            color = colors[count % colors.count]
                            withAnimation {
                                textOpacity = 1.0
                            } completion: {
                                withAnimation {
                                    textOpacity = 0.0
                                }
                            }
                        })
                )
            Text("Tap!")
                .font(.system(size: 56))
                .opacity(textOpacity)

        }
    }
}
