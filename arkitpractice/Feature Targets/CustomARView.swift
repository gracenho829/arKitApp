//
//  CustomARView.swift
//  arkitpractice
//
//  Created by Grace Nho on 2024/02/15.
//

import ARKit
import RealityKit
import SwiftUI

class CustomARView: ARView{
    required init(frame frameRect:CGRect){
        super.init(frame:frameRect)
    }
    
    dynamic required init?(coder decoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
    }
    
    func configurationExample(){
        //Tracks the device relative to it's environment
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration)
        
        //Not supported in all regions, tracks w.r.t global coordinates
        let _ = ARGeoTrackingConfiguration()
        
        //Tracks faces in the scene
        let _ = ARFaceTrackingConfiguration()
        
        //Tracks bodies in the scene
        let _ = ARBodyTrackingConfiguration()
    }
    
    func anchorExample(){
        let coordinateAnchor = AnchorEntity(world: .zero)
        
        //Attach anchors to detected planes
        let _ = AnchorEntity(plane: .horizontal)
        let _ = AnchorEntity(plane: .vertical)
        
        let _ = AnchorEntity(.face)
        
        let _ = AnchorEntity(.image(group: "group", name: "name"))
        
        scene.addAnchor(coordinateAnchor)
    }
    
    func entityExamples(){
        
    }
    
    func placeBlueBlock(){
        
    }
}
