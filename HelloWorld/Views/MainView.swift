//
//  MainView.swift
//  HelloWorld
//
//  Created by Camila Campana on 13/09/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = TranslationViewModel()

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
