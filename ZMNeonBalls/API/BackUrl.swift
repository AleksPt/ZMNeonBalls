import Foundation

struct BackUrl {
    let backUrl1: String
    let backUrl2: String
}

extension BackUrl: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        let values = container.allKeys.compactMap { key in
            try? container.decode(String.self, forKey: key)
        }

        guard values.count >= 2 else {
            throw DecodingError.dataCorrupted(
                .init(
                    codingPath: container.codingPath,
                    debugDescription: "Not enough keys to decode back URLs"
                )
            )
        }

        self.backUrl1 = values[0]
        self.backUrl2 = values[1]
    }
}

struct AnyCodingKey: CodingKey {
    var stringValue: String
    var intValue: Int?

    init(stringValue: String) {
        self.stringValue = stringValue
    }

    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "\(intValue)"
    }
}
