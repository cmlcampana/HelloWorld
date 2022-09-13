//
//  Translation.swift
//  HelloWorld
//
//  Created by Camila Campana on 13/09/22.
//

import Foundation

struct TranslationText: Codable {
    let translatedText: String
}

struct TranslationData: Codable {
    let translations: [TranslationText]
}

struct Translation: Codable {
    let data: TranslationData
}
