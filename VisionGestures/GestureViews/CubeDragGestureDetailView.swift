//
//  CubeDragGestureDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeDragGestureDetailView: View {
    @State private var location: EntityTargetValue<DragGesture.Value>?

    var body: some View {
        VStack {
            CubeView(dragLocation: location)
                .gesture(DragGesture()
                    .targetedToAnyEntity()
                    .onChanged({ event in
                        self.location = event
                    })
                )
            
        }
    }
}
