//
//  CustomCheckbox.swift
//  Swiftui Todo list
//
//  Created by Dan I on 7/7/23.
//

import SwiftUI

struct CustomCheckbox: View {
    var onCheck: (Bool) -> Void
    
    @State private var localChecked = false
    
    init(defaultChecked: Bool, onCheck: @escaping (Bool) -> Void) {
        self.localChecked = defaultChecked
        self.onCheck = onCheck
    }
    
    var body: some View {
        Button {
            localChecked.toggle()
            
            onCheck(localChecked)
        } label: {
            Image(systemName: localChecked ? "checkmark.circle.fill" : "circle")
                .resizable()
                .aspectRatio(contentMode: .fit)       
        }
    }
}

struct CustomCheckbox_Previews: PreviewProvider {
    static var previews: some View {
        CustomCheckbox(defaultChecked: false) { checked in
            
        }.frame(width: 50)
    }
}
