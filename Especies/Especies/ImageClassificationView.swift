import SwiftUI
import CoreML

struct ImageClassificationView: View {
    let model = try? MobileNetV2(configuration: MLModelConfiguration())
    @State private var classificationLabel: String = ""
    @State private var image: UIImage?

    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(named: "fern")!)
                .resizable()
                .frame(width: 200, height: 200)

            Button("Classify") {
                classifyImage()
            }
            .padding()
            .foregroundColor(Color.white)
            .background(Color.green)

            // The Text View that we will use to display the results of the classification
            Text(classificationLabel)
                .padding()
                .font(.body)
        }
        Spacer()
    }

    private func classifyImage() {
        guard let image = image,
              let resizedImage = image.resizeImageTo(size: CGSize(width: 224, height: 224)),
              let buffer = resizedImage.convertToBuffer() else {
            return
        }

        do {
            let output = try model?.prediction(image: buffer)
            if let output = output {
                let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
                let result = results.map { (key, value) in
                    return "\(key) = \(String(format: "%.2f", value * 100))%"
                }.joined(separator: "\n")

                self.classificationLabel = result
            }
        } catch {
            print("Error classifying image: \(error)")
        }
    }
}

#Preview {
    ImageClassificationView()
}
