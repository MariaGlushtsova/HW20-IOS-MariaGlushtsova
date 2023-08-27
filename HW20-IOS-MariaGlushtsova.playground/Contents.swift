import UIKit

struct Cards: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String?
    let manaCost: String?
    let type: String?
    let rarity: String?
    let artist: String?
    let number: String?
    let power: String?
}

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else { return }
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data else { return }
        let dataAsString = String(data: data, encoding: .utf8)
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(Cards.self, from: data)
            print("Имя карты: \(result.cards.first?.name ?? "")\nМана-стоимость: \(result.cards.first?.manaCost ?? "")\nВид карты: \(result.cards.first?.type ?? "")\nРедкость карты: \(result.cards.first?.rarity ?? "")\nХудожник: \(result.cards.first?.artist ?? "")\nНомер карты: \(result.cards.first?.number ?? "")\nСила карты: \(result.cards.first?.power ?? "")")
        } catch let error {
            print("\(error.localizedDescription)")
        }
    }.resume()
}

// Opt
getData(urlRequest:"https://api.magicthegathering.io/v1/cards?name=Opt")

// Black Lotus
getData(urlRequest:"https://api.magicthegathering.io/v1/cards?name=Black%20Lotus")

