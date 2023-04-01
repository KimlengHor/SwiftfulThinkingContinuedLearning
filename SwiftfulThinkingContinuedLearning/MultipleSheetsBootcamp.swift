//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kimleng Hor on 4/1/23.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

//use binding
//use multiple sheet
//use $item

struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel?
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                selectedModel = RandomModel(title: "ONE")
            }
            
            Button("Button 2") {
                selectedModel = RandomModel(title: "TWO")
            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View {
    
//    @Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
