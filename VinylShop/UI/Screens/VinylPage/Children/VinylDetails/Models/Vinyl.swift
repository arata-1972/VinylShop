import UIKit

struct Vinyl: Decodable {
    let id: Int
    let title: String
    let band: String
    let image: String
    let sides: [Side]
    let recommendedIDs: [Int]
}
