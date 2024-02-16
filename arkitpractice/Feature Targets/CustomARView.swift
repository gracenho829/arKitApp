//
//  CustomARView.swift
//  arkitpractice
//
//  Created by Grace Nho on 2024/02/15.
//

import ARKit
import RealityKit
import SwiftUI
import Combine

class CustomARView: ARView{
    required init(frame frameRect:CGRect){
        super.init(frame:frameRect)
    }
    
    dynamic required init?(coder decoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        subscribeToActionStream()
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
    
    private var cancellables: Set<AnyCancellable> = []
    func subscribeToActionStream(){
        ARManager.shared.actionStream.sink{[weak self]action in
            switch action{
            case .placeBlock(let color):
                self?.placeBlock(ofColor: color)
            case .removeAllAnchors:
                self?.scene.anchors.removeAll()
            }
        }.store(in: &cancellables)
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
        //Load an entity from a usdz file
        let _ = try? Entity.load(named: "usdzFileName")
        let _ = try? Entity.load(named: "realityFileName")
        
        //Generate an entity with code
        
        let box = MeshResource.generateBox(size:1)
        let entity = ModelEntity(mesh: box)
        
        //Add entity to an anchor, so it's placed in the scene
        let anchor = AnchorEntity()
        anchor.addChild(entity)
        
    }
    
    func placeBlock(ofColor color: Color){
        let block = MeshResource.generateBox(size: 1)
        let material = SimpleMaterial(color: UIColor(color), isMetallic: false)
        let entity = ModelEntity(mesh: block, materials: [material])
        
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(entity)
        
        scene.addAnchor(anchor)
        
    }
}
