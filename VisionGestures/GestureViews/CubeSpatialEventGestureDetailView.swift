//
//  CubeSpatialEventGestureDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeSpatialEventGestureDetailView: View {
    @State var location3D: String = ""
    @State var kind: String = ""
    @State var phase: String = " "

    var body: some View {
        VStack {
            Text(location3D).font(.system(size: 25)).padding(.horizontal)
            Text(kind).font(.system(size: 25))
            Text(phase).font(.system(size: 25))
            CubeView()
                .gesture(SpatialEventGesture()
                    .targetedToAnyEntity()
                    .onChanged({ events in
                        for event in events.gestureValue {
                            fillText(with: event)
                        }
                        
                    })
                    .onEnded { events in
                        for event in events.gestureValue {
                            fillText(with: event)
                        }
                     })
        }
    }
    private func fillText(with event: SpatialEventCollection.Event) {
        location3D = "location3D: \(event.location3D) "
        kind = "Kind: \(event.kind)"
        phase = "Phase: \(event.phase)"

    }
}
