//
//  Homepage.swift
//  BakuSlideShow
//
//  Created by Rasul Mammadov on 04.02.22.
//

import SwiftUI

struct Homepage: View {
    
    @State var MainTab = "Baku1"
    
    var body: some View {
        ZStack {
            
            GeometryReader{ proxy in
                
                let size = proxy.size
                
                Image(MainTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(1)
                
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            .colorScheme(.dark)
            
            // Slider
            
            TabView(selection: $MainTab) {
                
                ForEach(1...6, id: \.self) { index in
                    
                    SlideMain(index: index)
                    
                }
                
            }
            
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
        }
    }
}

struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}
