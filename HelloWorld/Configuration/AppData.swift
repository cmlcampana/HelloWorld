import Foundation

struct AppData {
    static let shared = AppData()

    var baseURL: String {
        "https://google-translate1.p.rapidapi.com/language/translate/v2"
    }
    var apiKey: String {
        ""
    }
}
