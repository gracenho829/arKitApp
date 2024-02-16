//
//  ContentView.swift
//  arkitpractice
//
//  Created by Grace Nho on 2024/02/15.
//

import SwiftUI

struct ContentView: View{
    @State private var colors: [Color] = [.green, .red, .blue, .indigo]
    var body: some View{
        CustomARViewRepresentable().ignoresSafeArea().overlay(alignment: .bottom){
            ScrollView(.horizontal){
                HStack{
                    Button{
                        ARManager.shared.actionStream.send(.removeAllAnchors)
                    } label:{
                        Image(systemName: "trash").resizable().scaledToFit().frame(width:40, height:40).padding().background(.regularMaterial)
                     }
                    ForEach(colors, id: \.self){
                        color in
                        Button{
                            ARManager.shared.actionStream.send(.placeBlock(color: color))
                        } label:{
                            color.frame(width:40, height:40).padding().background(.regularMaterial).cornerRadius(16)
                         }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
