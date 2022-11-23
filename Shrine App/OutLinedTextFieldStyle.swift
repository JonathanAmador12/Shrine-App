//
//  OutLinedTextFieldStyle.swift
//  Shrine App
//
//  Created by JonathanA on 22/11/22.
//

import SwiftUI

struct OutLinedTextFieldStyle: TextFieldStyle {
    var focusField: Bool
    func _body(configuration: TextField<Self._Label>)-> some View{
        configuration
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 20))
            .overlay{
                if focusField{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("primary"))
                }else{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                }
            }
    }
}
