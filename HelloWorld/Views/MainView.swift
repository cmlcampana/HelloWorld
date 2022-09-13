//
//  MainView.swift
//  HelloWorld
//
//  Created by Camila Campana on 13/09/22.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = TranslationViewModel()
    @State private var text: String = ""
    @State private var error: String = ""

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.secondary)


            VStack(alignment: .center) {
                Text("Write your text here")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.secondary)
                TextEditor(text: $text)
                    .frame(height: 80)
                    .border(Color.gray, width: 1)
                    .cornerRadius(8)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                    .font(.body)

                Text(error)
                    .padding()
                    .font(.caption)
                    .foregroundColor(.red)
                    .opacity(error.isEmpty ? 0 : 1)
                    .padding(.top, -10)

                HStack(alignment: .center) {
                    Spacer()

                    Button(action: {
                        if !text.isEmpty {
                            translateText(with: text)
                        } else {
                            error = "Text can't be empty."
                        }
                    }) {
                        Text("Translate")
                            .font(.subheadline)
                    }
                    .buttonStyle(.borderedProminent)

                    Button(action: {
                        text = ""
                        error = ""
                    }) {
                        Text("Clear text")
                            .font(.subheadline)
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()
                }


            }
            .padding()
        }
    }

    private func translateText(with text: String) {
        Task {
            await viewModel.translateText(value: text)
            error = viewModel.error
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
