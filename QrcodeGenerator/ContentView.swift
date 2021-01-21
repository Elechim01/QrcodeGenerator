//
//  ContentView.swift
//  QrcodeGenerator
//
//  Created by Michele on 21/01/21.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    var body: some View {
       QRView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
