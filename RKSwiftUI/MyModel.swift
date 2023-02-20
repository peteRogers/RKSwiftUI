//
//  RKView.swift
//  RKSwiftUI
//
//  Created by Peter Rogers on 31/01/2023.
//

import Foundation
import SwiftUI
import RealityKit

class MyModel: ObservableObject{
    @Published var text = "Nothing Hit"
    weak var arView:ARView?
    
    init(){
        
    }
    
    func initScene(){
        let boxAnchor = try! Experience.loadBox()
        // Add the box anchor to the scene
        print("foofo")
        arView?.scene.anchors.append(boxAnchor)
        boxAnchor.actions.hitCube.onAction = {entity in
            self.text = "model hit\(Int.random(in: 0 ... 10))"
               }
    }
    
  
    
    
}
