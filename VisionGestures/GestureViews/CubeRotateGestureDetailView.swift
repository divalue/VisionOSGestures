//
//  CubeRotateGestureDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeRotateGestureDetailView: View {
    @State private var rotation: Angle = .zero
    @State var description = ""

    var body: some View {
        VStack {
            Text(description)
                .font(.system(size: 30))
            CubeView(rotation: rotation)
                .gesture(RotateGesture()
                    .targetedToAnyEntity()
                    .onChanged { event in
                        rotation = event.gestureValue.rotation
                        description = "Angle: \(event.gestureValue.rotation.radians) "
                     })
        }
    }
}
