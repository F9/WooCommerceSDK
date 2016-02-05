import Foundation
import ObjectMapper

public struct PaymentDetails: Mappable {
    var methodId: String?
    var methodTitle: String?
    var paid: Bool?

    public init?(_ map: Map) {}

    mutating public func mapping(map: Map) {
        methodId <- map["method_id"]
        methodTitle <- map["method_title"]
        paid <- map["paid"]
    }
}