//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kimleng Hor on 4/1/23.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 2
    
    var body: some View {
        ZStack {
            starsView.overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
//                    .foregroundColor(Color.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }).allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
