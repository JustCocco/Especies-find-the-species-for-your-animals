import SwiftUI
import CoreML
import Combine
struct ImageClassificationView: View {
    let model = SqueezeNet()
    @State private var classificationLabel: String = ""
    @State private var yourText: String = "your species is..."
    
    let newImage : UIImage!
    
    
    func imageClassification() {
        guard let img = newImage,
              let resizedImage = img.resizeTo(size: CGSize(width: 227, height: 227)),
              let buffer = resizedImage.toBuffer()
        else { return }
        
        let output = try? model.prediction(image: buffer)
        
        if let output = output {
            self.classificationLabel = output.classLabel
        }
    }
    
    
    var body: some View {
        NavigationView{
            
            
            VStack {
                
                VStack {
                    Group {
                        if newImage != nil {
                            
                                
                            Image(uiImage: newImage!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 224,alignment: .top)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .shadow(radius:10)
                                .accessibilityLabel("your image")
                        }
                        
                    }
                }
                
                
                Button("Classify") {
                    self.imageClassification()
                        
                    
                    
                    
                    
                }.padding()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .accessibilityLabel("Button for Classification")
                
                
                
                Text(classificationLabel)
                    .font(.title)
                
                    .padding(15)
                    
                
            }
                         
        
            
            
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(EdgeInsets(top: 80, leading: 5, bottom: 200, trailing: 5))
            .navigationBarItems(leading:
                                    NavigationLink(destination: MainView().navigationBarBackButtonHidden(true)) {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    
                Text("back")
                    .font(.title3)
        })
            
            
        }
        
    }
    
}
    
    
//#Preview {
//    ImageClassificationView()
//}

class ImageManager {
    static let shared = ImageManager()
    private init() {}
    
    var actionStream = PassthroughSubject<ImageAction, Never>()
}


enum ImageAction{
    case sendImage(image: UIImage?)
}

struct ImageClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        let newImage = UIImage(named: "wolf") // replace with your image name
        let imageClassificationView = ImageClassificationView(newImage: newImage)
        
        return imageClassificationView
            .onAppear {
                // Simulate sending an image action when the view appears
                ImageManager.shared.actionStream.send(.sendImage(image: newImage))
            }
    }
}
