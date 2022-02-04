//
//  SlideMain.swift
//  BakuSlideShow
//
//  Created by Rasul Mammadov on 04.02.22.
//

import SwiftUI

struct SlideMain: View {
    var index: Int
    
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            
            
            let size = proxy.size
            
            ZStack {
                
                Image("Baku\(index)") //to get all pictures
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame( width: size.width - 8, height: size.height / 1.2)
                    .cornerRadius(12)
                
                VStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Written in SwiftUI 3.0")
                        .font(.title2.bold())
                        
                        .kerning(1.9) //gives letters a space
                    
                    Text("This is secondary text here.")
                        .foregroundStyle(.secondary)
                    
                }
                .foregroundStyle(.black)
                .padding(.top)

                Spacer(minLength: 0)
                    VStack(spacing: 25) {
                        HStack(spacing: 15) {
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Azerbaijan - The Land of Fire")
                                    .font(.title3.bold())
                            }
                            .foregroundStyle(.black)
                            
                        }
                        
                    }
                    .padding(20)
                    .padding(.horizontal, 10)
                    .background(.white)
                    .opacity(0.9)
                    .cornerRadius(10)
                }
                .padding(20)
            }
            
            .frame( width: size.width - 8, height: size.height / 1.2)
            .frame( width: size.width - 8, height: size.height)
        }
        .tag("Baku\(index)") //to change the background picture
        
        .rotation3DEffect(.init(degrees: Action() * 90), axis: (x: 0, y: 1, z: 0), anchor: offset > 0 ? .leading: .trailing, anchorZ: 0, perspective: 0.8)
        
        .modifier(ThreeDRotate(anchorPoint: .leading, offset: $offset))
        
        
    }
    
    func Action() -> CGFloat {
        let progress = -offset / UIScreen.main.bounds.width
        
        return progress
    }
}

struct SlideMain_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
