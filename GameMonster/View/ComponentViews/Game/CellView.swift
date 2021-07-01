//
//  CellView.swift
//  GameMonster
//
//  Created by Mason Dierkes on 6/30/21.
//

import SwiftUI

struct CellView : View {
    let cell: Token
    let proxy: GeometryProxy
    
    @State private var animate = false
    
    private let scale = 0.125
    
    var body: some View {
        ZStack{
            

            Circle()
                .innerShadow(using: Circle(), color: Color("CellShadow"))
                .foregroundColor(Color("BoardDarkBlue"))
                .padding(6)
                .frame(width: proxy.size.width * scale, height: proxy.size.width * scale)

            
            if cell.color != Color("BoardDarkBlue"){
                Circle()
                    .foregroundColor(cell.color)
                    .padding(6)
                    .frame(width: proxy.size.width * scale, height: proxy.size.width * scale)
                    .offset(y: animate ? 0 : -300)
                    .animation(.interpolatingSpring(stiffness: 150, damping: 17, initialVelocity: 0.5))
                    .onAppear {
                        animate = true
                    }

            }
         

        }
        
    }
}

extension Token {
    var color: Color {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        case .empty: return Color("BoardDarkBlue")
        }
    }
}


extension View {
    func innerShadow<S: Shape>(using shape: S, angle: Angle = .degrees(0), color: Color = .black, width: CGFloat = 6, blur: CGFloat = 6) -> some View {
        let finalX = CGFloat(cos(angle.radians - .pi / 2))
        let finalY = CGFloat(sin(angle.radians - .pi / 2))
        
        return self
            .overlay(
                    shape
                        .stroke(color, lineWidth: width)
                        .offset(x: finalX * width * 0.6, y: finalY * width * 0.6)
                        .blur(radius: blur)
                        .mask(shape)
                )
    }
}

//struct CellView_Previews : PreviewProvider {
//    static var previews: some View {
//        Group {
//            CellView(cell: .red)
//            CellView(cell: .yellow)
//            CellView(cell: .empty)
//        }
//    }
//}
