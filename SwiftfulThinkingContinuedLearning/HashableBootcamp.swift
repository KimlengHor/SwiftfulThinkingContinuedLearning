//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kimleng Hor on 4/2/23.
//

import SwiftUI

struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR"),
        MyCustomModel(title: "FIVE"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                }
                .font(.headline)
            }
        }
    }
}

struct HashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HashableBootcamp()
    }
}
