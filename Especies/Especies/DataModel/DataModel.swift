// AnimalDataModel.swift

import SwiftUI



struct Item {
    var imageName: String
    var text: String
    var category: String
}
    
    struct AnimalDataModel {
        static let data: [Item] = [
            Item(imageName: "cat", text: "cat", category: "animals"),
            Item(imageName: "dog", text: "dog", category: "animals"),
            Item(imageName: "fern", text: "fern", category: "plants"),
            Item(imageName: "nibbio", text: "nibbio", category: "animals")
        ]
    }



