//
//  ContentView.swift
//  arkitpractice
//
//  Created by Grace Nho on 2024/02/15.
//

import SwiftUI

struct ContentView: View{
    var body: some View{
        CustomARViewRepresentable().ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
