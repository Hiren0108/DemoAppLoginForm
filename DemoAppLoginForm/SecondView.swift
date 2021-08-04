//
//  SecondView.swift
//  DemoAppLoginForm
//
//  Created by IOSDEV1 on 03/08/21.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Button("Done") {
            self.presentation.wrappedValue.dismiss()
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }   
}
