//
//  QRView.swift
//  QrcodeGenerator
//
//  Created by Michele on 21/01/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRView: View {
    @State private var name = "Name"
    @State private var emailAddress = "email@example.com"
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationView{
            VStack{
                Text("QR Code Generator")
                    .font(.largeTitle)
                    .bold()
                TextField("name",text:$name)
                    .textContentType(.name)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(.horizontal)
                TextField("Email Address",text: $emailAddress)
                    .textContentType(.emailAddress)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding([.horizontal,.bottom])
                    .autocapitalization(.none)
                Spacer()
                Image(uiImage: generatorQRCode(form: "\(name)\n\(emailAddress)"))
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
            }
        }
    }
    
    func generatorQRCode(form string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage{
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent){
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
