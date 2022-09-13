//
//  TranslationViewModel.swift
//  HelloWorld
//
//  Created by Camila Campana on 13/09/22.
//

import Foundation

final class TranslationViewModel: ObservableObject {
    private let repository: TranslationRepositoryProtocol

    @Published private(set) var translations: [TranslationText] = []
    @Published private(set) var error: String = ""

    init(repository: TranslationRepositoryProtocol = TranslationRepository()) {
        self.repository = repository
    }

    func translateText(value: String) async {
        let result = await repository.translateText(value: value)

        DispatchQueue.main.async {
            switch result {
            case .success(let translations):
                self.translations = translations.data.translations
            case .failure(let error):
                self.error = error.localizedDescription
            }
        }
    }
}
