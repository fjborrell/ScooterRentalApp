//
//  CustomQRCode.swift
//  Scooter
//
//  Created by Fernando Borrell on 11/30/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct CustomQRCode: View {
    let ciContext = CIContext()
    let ciFilter = CIFilter.qrCodeGenerator()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 8.0) {
            HStack(spacing: 10.0) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
                Text("Username")
                    .font(.custom("Pally-Medium", size: 22))
                    .foregroundStyle(colorScheme == .dark ? Color.black : Color.white)
            }
            .padding(.bottom, 0)
            .padding([.top, .horizontal], 20)
            
            Image(uiImage: generateQRCode(from: "https://www.unibe.edu.do"))
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                .frame(width: 230, height: 230)
                .padding(30)
        }
        .padding()
        .background(colorScheme == .dark ? Color.white.opacity(0.85) : Color.black.opacity(0.85))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        ciFilter.setValue(data, forKey: "inputMessage")

        let transform = CGAffineTransform(scaleX: 10, y: 10) // Scale the QR code here

        if let qrCodeImage = ciFilter.outputImage?.transformed(by: transform) {
            let qrCodeCGImage = ciContext.createCGImage(qrCodeImage, from: qrCodeImage.extent)
            
            // Determine the size of the final image
            let imageSize = CGSize(width: 250, height: 250) // The size of the image within the SwiftUI view
            let qrCodeSize = CGSize(width: 200, height: 200) // The desired size of the QR code within the image
            
            // Create a new image with the desired size
            let renderer = UIGraphicsImageRenderer(size: imageSize)
            let roundedImage = renderer.image { context in
                // Fill the background with white color
                UIColor.white.setFill()
                context.fill(CGRect(origin: .zero, size: imageSize))

                // Calculate the drawing area for the QR code to center it
                let qrCodeOrigin = CGPoint(x: (imageSize.width - qrCodeSize.width) / 2, y: (imageSize.height - qrCodeSize.height) / 2)
                let qrCodeRect = CGRect(origin: qrCodeOrigin, size: qrCodeSize)

                // Draw the QR code in the center of the image
                if let qrCodeCGImage = qrCodeCGImage {
                    context.cgContext.draw(qrCodeCGImage, in: qrCodeRect)
                }
            }
            
            return roundedImage
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }


}

#Preview {
    CustomQRCode()
}
