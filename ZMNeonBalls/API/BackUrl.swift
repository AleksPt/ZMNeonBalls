import Foundation

struct BackUrl: Decodable {
    let backUrl1: String
    let backUrl2: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        self.backUrl1 = try container.decode(
            String.self,
            forKey: DynamicCodingKeys(stringValue: Constants.backUrl1)!
        )
        self.backUrl2 = try container.decode(
            String.self,
            forKey: DynamicCodingKeys(stringValue: Constants.backUrl2)!
        )
    }
}

struct DynamicCodingKeys: CodingKey {
    var stringValue: String
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int? { nil }
    init?(intValue: Int) { return nil }
}
