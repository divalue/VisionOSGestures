//
//  CubeView.swift
//  VisionGestures
//
//  Created by Dmitrii on 26.11.2023.
//

import Foundation
import SwiftUI
import RealityKit

struct CubeView: View {
    var color = Color.green
    var scale: Float = 1
    var tapLocation: EntityTargetValue<SpatialTapGesture.Value>?
    var dragLocation:  EntityTargetValue<DragGesture.Value>?
    var rotation: Angle = .zero
    var rotation3D: Rotation3D = .identity

    @State var object: ModelEntity = ModelEntity()
    

    var body: some View {
        RealityView { content in
            let model = ModelEntity(
                mesh: .generateBox(size: 0.1),
                         materials: [SimpleMaterial(color: .white, isMetallic: false)])
            
            model.components.set(InputTargetComponent())
            object.addChild(model)
            object.generateCollisionShapes(recursive: true)
            content.add(object)
        } update: { content in
            if let model = content.entities.first {
                model.transform.scale =  [1.0, 1.0, 1.0] * scale
                (model.children.first as? ModelEntity)?.model?.materials = [
                    SimpleMaterial(color: .init(color), isMetallic: false)
                ]
            }
        }
        .rotationEffect(rotation)
        .rotation3DEffect(rotation3D)
        .onChange(of: tapLocation) {
            if let tapLocation {
                let tapModel = ModelEntity(
                    mesh: MeshResource.generateSphere(radius: 0.01),
                                  materials: [SimpleMaterial(color: .red, isMetallic: false)]
                )
                tapModel.position = tapLocation.convert(tapLocation.location3D, from: .local, to: object)
                object.addChild(tapModel)

            }
        }
        .onChange(of: dragLocation) {
            if let dragLocation {
                object.position = dragLocation.convert(dragLocation.location3D, from: .local, to: object.parent!)
                
            }
        }

    }
}

