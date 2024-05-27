//
//  CubeSpatialTapGestureDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeSpatialTapGestureDetailView: View {
    @State private var location: EntityTargetValue<SpatialTapGesture.Value>?

    var body: some View {
        VStack {
            CubeView(tapLocation: location)
                .gesture(SpatialTapGesture()
                    .targetedToAnyEntity()
                    .onEnded { event in
                        self.location = event
                     })
        }
    }
}
