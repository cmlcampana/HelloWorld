//
//  TranslationRepository.swift
//  HelloWorld
//
//  Created by Camila Campana on 13/09/22.
//

import Foundation

protocol TranslationRepositoryProtocol {
    func translateText(value: String) async -> Result<Translation, NetworkError>
}

final class TranslationRepository: TranslationRepositoryProtocol {
    private let manager: NetworkManagerProtocol

    init(manager: NetworkManagerProtocol = NetworkManager()) {
        self.manager = manager
    }

    func translateText(value: String) async -> Result<Translation, NetworkError> {
        do {
            let request = NetworkRequest.buildGetRequest(
                path: "",
                headers: [
                    "content-type": "application/x-www-form-urlencoded",
                    "Accept-Encoding": "application/gzip",
                    "X-RapidAPI-Key": AppData.shared.apiKey,
                    "X-RapidAPI-Host": "google-translate1.p.rapidapi.com"
                ],
                params: [
                    "q": AnyEncodable(value),
                    "target": AnyEncodable("pt-BR"),
                    "source": AnyEncodable("en")
                ]
            )
            let result: Translation = try await manager.request(request)
            return .success(result)
        } catch {
            return .failure(.genericError)
        }
    }
}
