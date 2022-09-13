import Foundation

struct AppData {
    static let shared = AppData()

    var baseURL: String {
        "https://google-translate1.p.rapidapi.com/language/translate/v2"
    }
    var apiKey: String {
        "8398caf439mshad66f1425eacbf6p14a13djsnbbe4d7262881"
    }
}
