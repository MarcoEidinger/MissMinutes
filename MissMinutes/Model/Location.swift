import Foundation

enum Location: Int, CaseIterable {
    case sf = 0
    case berlin = 1
    case bangalore = 2
    case shanghai = 3

    var name: String {
        switch self {
        case .sf:
            return "San Francisco"
        case .berlin:
            return "Berlin"
        case .shanghai:
            return "Shanghai"
        case .bangalore:
            return "Bangalore"
        }
    }
}
