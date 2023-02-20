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
        model?.arView = arView
        model?.initScene()
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}




