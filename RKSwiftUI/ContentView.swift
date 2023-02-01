//
//  ContentView.swift
//  RKSwiftUI
//
//  Created by Peter Rogers on 31/01/2023.
//

import SwiftUI
import RealityKit

struct ContentView : View {
   
    @StateObject var model = MyModel()
    var body: some View {
        VStack{
            ARViewContainer(model: model).edgesIgnoringSafeArea(.all)
            Text(model.text)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    var model:MyModel?
    init(model: MyModel ) {
           self.model = model
       }
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        boxAnchor.actions.hitCube.onAction = {entity in
                   model?.text = "model hit"
               }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}




