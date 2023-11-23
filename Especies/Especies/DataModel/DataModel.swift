// AnimalDataModel.swift

import SwiftUI



struct Item {
    var imageName: String
        
    var text: String
    var category: String
}
    
    struct AnimalDataModel {
        static let data: [Item] = [
            Item(imageName: "wolf", text: "wolf", category: "animals"),
            Item(imageName: "cat", text: "wild cat", category: "animals"),
            Item(imageName: "squirrel", text: "squirrel", category: "animals"),
            Item(imageName: "nibbio", text: "nibbio", category: "animals"),
            Item(imageName: "otter", text: "otter", category: "animals"),
            Item(imageName: "driomio", text: "driomio", category: "animals"),
            Item(imageName: "roe deer", text: "roe deer", category: "animals"),
            Item(imageName: "badger", text: "badger", category: "animals"),
            Item(imageName: "fox", text: "fox", category: "animals"),
            Item(imageName: "loricato", text: "loricato", category: "plants"),
            Item(imageName: "cerris", text: "cerris", category: "plants"),
            Item(imageName: "alder", text: "alder", category: "plants"),
            Item(imageName: "rosehip", text: "rosehip", category: "plants"),
            Item(imageName: "beech", text: "beech", category: "plants"),
            Item(imageName: "mauve", text: "mauve", category: "plants"),
            Item(imageName: "lavender", text: "lavender", category: "plants"),
            Item(imageName: "fern", text: "fern", category: "plants"),
            Item(imageName: "sage", text: "sage", category: "plants"),
            
            Item(imageName: "porcini", text: "porcini", category: "fungi"),
            Item(imageName: "cardoncelli", text: "cardoncelli", category: "fungi"),
            Item(imageName: "ovule", text: "ovule", category: "fungi"),
            Item(imageName: "evilOvule", text: "evil Ovule", category: "fungi"),
            Item(imageName: "chanterelle", text: "chanterelles", category: "fungi"),
            Item(imageName: "vavusi", text: "vavusi", category: "fungi"),
            Item(imageName: "rositi", text: "rositi", category: "fungi"),
            Item(imageName: "ordinati", text: "ordinati", category: "fungi"),
            Item(imageName: "coculino", text: "coculini", category: "fungi")
            
        ]
    }



