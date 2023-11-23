//
//  CameraView.swift
//  Especies
//
//  Created by Gianrocco Di Tomaso on 16/11/23.
//

import SwiftUI
import AVFoundation
import Combine

struct MainView:View {
    
    
    @State private var typeofspecies: String = "animals"
    @StateObject private var model = FrameHandler()
    @State private var showSheet : Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image : UIImage?
    
    @State private var currentDataSet: [Item] = AnimalDataModel.data
    @State private var isImagePicked: Bool = false
   
    
    
    
    let searchSuggestions = ["animals", "plants", "fungi"]
    
    var body: some View {
        
        NavigationView{if isImagePicked {
            
            ImageClassificationView(newImage: image!)
        } else {
            ZStack{
                
                ZStack {
                    
                    ZStack {
                        List{
                            
                            HStack {
                                Image(systemName: "location.circle")
                                Text("Species nearby")
                                    .scaleEffect(1.1)
                                    
                                
                                
                                
                                Picker("", selection: $typeofspecies) {
                                    ForEach(searchSuggestions, id: \.self) { suggestion in
                                        Text(suggestion).tag(suggestion)
                                        
                                            
                                        
                                        
                                        
                                    }
                                    
                                }
                                
                                .pickerStyle(MenuPickerStyle())
                                .textFieldStyle(.roundedBorder)
                                .padding(0)
                                .scaleEffect(1.1)
                                
                                
                                
                                
                                .onSubmit {
                                    
                                }
                                .textInputAutocapitalization(.never)
                                .border(Color.clear)
                                .font(.title3)
                                .disableAutocorrection(true)
                                .textFieldStyle(.roundedBorder)
                                .padding(EdgeInsets(top: 2,leading: 10,bottom: 2,trailing: 10))
                                .listRowSeparator(.automatic)
                                
                                
                            }
                            
                            
                            
                        }  .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Button(action: {
                                    self.showSheet = true
                                }, label: {
                                    Image(systemName: "camera")
                                        .resizable()
                                        .scaleEffect(CGSize(width: 1.5, height: 1.5))
                                        
                                })
                                .actionSheet(isPresented: $showSheet) {
                                    ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                                        .default(Text("Photo Library")) {
                                            self.showImagePicker = true
                                            self.sourceType = .photoLibrary
                                        },
                                        .default(Text("Camera")) {
                                            self.showImagePicker = true
                                            self.sourceType = .camera
                                        },
                                        .cancel()
                                    ])
                                }
                            }
                        }
                        .onChange(of: image) { newImage in
                            if newImage != nil && !isImagePicked {
                                self.isImagePicked = true
                            }
                        }
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(
                                image: self.$image,
                                isShown: self.$showImagePicker,
                                sourceType: self.sourceType
                            )
                        }
                        
                        
                    }
                    .navigationTitle("ESpecies")
                }
                .overlay(
                ZStack{
                    
                    VStack(alignment: .leading) {
                        
                        LazyVGrid(columns:Array(repeating: (GridItem(.flexible(),spacing: 8)), count: 3)) {
                            ForEach(currentDataSet.filter({ item in item.category == typeofspecies}), id: \.imageName)  { item in
                                VStack {
                                    
                                    Image(item.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 111.88, height: 100)
                                        .cornerRadius(90)
                                        .clipShape(Circle())
                                    Text(item.text)
                                }
                            }
                        }
                    }
                    
                } .padding(30)
                    .frame(width: 400, height: 500, alignment: .topLeading)
                
            )
            
        
            
            
            }
        
    }
    }
        }
            
    func sendTheImage() {
        
            ImageManager.shared.actionStream.send(.sendImage(image: image))
    }
               
}
    

    


#Preview {
    MainView()
}

