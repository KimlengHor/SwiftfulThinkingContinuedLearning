//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kimleng Hor on 4/2/23.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        //sort
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        
        //filter
//        filteredArray = dataArray.filter({$0.isVerified})
        
        //map
//        mappedArray = dataArray.map({$0.name})
        mappedArray = dataArray.compactMap({$0.name})
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Kim", points: 5, isVerified: true)
        let user2 = UserModel(name: "Kim1", points: 0, isVerified: false)
        let user3 = UserModel(name: nil, points: 2, isVerified: true)
        let user4 = UserModel(name: "Kim3", points: 3, isVerified: false)
        let user5 = UserModel(name: "Kim4", points: 1, isVerified: true)
        let user6 = UserModel(name: "Kim5", points: 7, isVerified: false)
        let user7 = UserModel(name: "Kim7", points: 9, isVerified: false)
        let user8 = UserModel(name: "Kim8", points: 8, isVerified: false)
        let user9 = UserModel(name: "Kim9", points: 10, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
