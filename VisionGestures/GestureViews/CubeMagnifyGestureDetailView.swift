//
//  CubeMagnifyGestureDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeMagnifyGestureDetailView: View {
    @State private var scale: Float = 1.0
    @State var description = ""

    var body: some View {
        VStack {
            Text(description)
                .font(.system(size: 30))
            CubeView(scale: scale)
                .gesture(MagnifyGesture()
                    .targetedToAnyEntity()
                    .onChanged { event in
                        description = " Magnification: \(event.gestureValue.magnification) \n Time: \(event.gestureValue.time) \n Velocity: \(event.gestureValue.velocity) \n StartLocation3D: \(event.gestureValue.startLocation3D)"
                        scale = Float(event.gestureValue.magnification)
                     })
        }
    }
}
