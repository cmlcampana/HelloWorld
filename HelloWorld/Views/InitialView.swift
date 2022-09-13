//
//  InitialView.swift
//  HelloWorld
//
//  Created by Camila Campana on 13/09/22.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                LottieView(name: "globe", loopMode: .loop)
                    .frame(width: 250, height: 250)
                Spacer()
            }
            Spacer()
        }
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
