//
//  PlantDataModel.swift
//  Especies
//
//  Created by Gianrocco Di Tomaso on 17/11/23.
//

// AnimalDataModel.swift

import SwiftUI

struct PlantDataModel {
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
