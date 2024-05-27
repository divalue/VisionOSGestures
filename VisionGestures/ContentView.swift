//
//  ContentView.swift
//  VisionGestures
//
//  Created by Dmitrii on 29.10.2023.
//

import SwiftUI
import RealityKit
import RealityKitContent


enum Gesture: String, CaseIterable {
    case TapGesture
    case SpatialTapGesture
    case LongPressGesture
    case SpatialEventGesture
    case DragGesture
    case MagnifyGesture
    case RotateGesture
    case RotateGesture3D
}

struct ContentView: View {
    private let data = Gesture.allCases
    @State private var selectedGesture: Gesture = Gesture.TapGesture

    var body: some View {
       NavigationSplitView {
           List {
               ForEach(data, id: \.self) { gesture in
                   ZStack {
                       Capsule()
                           .foregroundStyle(.white.opacity(0.001))
                           .hoverEffect()
                           .glassBackgroundEffect(displayMode: selectedGesture == gesture ? .always : .never)
                       HStack{
                           Text(gesture.rawValue).padding(.leading, 16)
                           Spacer()
                       }
                   }.onTapGesture {
                       selectedGesture = gesture
                   }
               }
           }
           .navigationTitle("Gestures")
       } detail: {
           view(for: selectedGesture)
               .navigationTitle(selectedGesture.rawValue)
       }

    }
    
    @ViewBuilder
    private func view(for selectedGesture: Gesture) -> some View {
        switch selectedGesture {
        case .TapGesture:
            CubeTapGestureDetailView()
        case .SpatialTapGesture:
            CubeSpatialTapGestureDetailView()
        case .LongPressGesture:
            CubeLongPressGestureDetailView()
        case .SpatialEventGesture:
            CubeSpatialEventGestureDetailView()
        case .DragGesture:
            CubeDragGestureDetailView()
        case .MagnifyGesture:
            CubeMagnifyGestureDetailView()
        case .RotateGesture:
            CubeRotateGestureDetailView()
        case .RotateGesture3D:
            CubeRotateGesture3DDetailView()
        }
    }
}


#Preview(windowStyle: .automatic) {
    ContentView()
}
