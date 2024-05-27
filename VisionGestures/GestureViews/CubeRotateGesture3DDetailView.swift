//
//  CubeRotateGesture3DDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeRotateGesture3DDetailView: View {
    @State private var rotation3D: Rotation3D = .identity
    @State var description = ""

    var body: some View {
        VStack {
            Text(description)
                .font(.system(size: 30))
            CubeView(rotation3D: rotation3D)
                .gesture(RotateGesture3D()
                    .targetedToAnyEntity()
                    .onChanged { event in
                        rotation3D = event.rotation
                        description = " Axis: \(event.gestureValue.rotation.axis.description)\n\n Angle: \(event.gestureValue.rotation.angle.radians) "
                    
                    })
        }
    }
}
