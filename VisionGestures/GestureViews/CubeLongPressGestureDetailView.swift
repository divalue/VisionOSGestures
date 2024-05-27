//
//  CubeLongPressGestureDetailView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeLongPressGestureDetailView: View {
    @State var scale: Float = 1.0
    
    var body: some View {
        VStack {
            CubeView(scale: scale)
                .gesture(LongPressGesture(minimumDuration: 1)
                    .targetedToAnyEntity()
                    .onEnded { event in
                        self.scale = self.scale == 1 ?  2 : 1
                     })
        }
    }
}



