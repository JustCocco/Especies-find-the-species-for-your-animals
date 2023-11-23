// AnimalDataModel.swift

import SwiftUI

struct FungiDataModel {
    struct Item {
        var imageName: String
        var text: String
    }

    static let data: [Item] = [
        Item(imageName: "cat", text: "cat"),
        Item(imageName: "dog", text: "dog"),
        Item(imageName: "rabbit", text: "rabbit")
    ]

    static let data1: [Item] = [
        Item(imageName: "lion", text: "wild cat"),
        Item(imageName: "tiger", text: "wild cat"),
        Item(imageName: "elephant", text: "elephant")
    ]

    static let data2: [Item] = [
        Item(imageName: "penguin", text: "bird"),
        Item(imageName: "koala", text: "marsupial"),
        Item(imageName: "dolphin", text: "mammal")
    ]
}
