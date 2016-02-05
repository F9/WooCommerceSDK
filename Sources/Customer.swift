import Alamofire
import Foundation
import ObjectMapper

public struct Customer: Mappable {
    var id: Int?
    var createdAt: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var username: String?
    var password: String?
    var lastOrderId: Int?
    var lastOrderDate: String?
    var ordersCount: Int?
    var totalSpent: Int?
    var avatarUrl: String?
    var billingAddress: String?
    var shippingAddress: String?

    public init?(_ map: Map) {}

    mutating public func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["created_at"]
        email <- map["email"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        username <- map["username"]
        password <- map["password"]
        lastOrderId <- map["last_order_id"]
        lastOrderDate <- map["last_order_date"]
        ordersCount <- map["orders_count"]
        totalSpent <- map["total_spent"]
        avatarUrl <- map["avatar_url"]
        billingAddress <- map["billing_address"]
        shippingAddress <- map["shipping_address"]
    }

    public static func get(id: Int, completion: (success: Bool, customer: Customer?) -> Void) {
        let client = Client.sharedClient
        let baseURL = NSURL(string: client.siteURL!)
        let requestURL = NSURL(string: "wc-api/v3/customers/\(id)", relativeToURL: baseURL)
        let requestURLString = requestURL!.absoluteString

        Alamofire.request(.GET, requestURLString)
            .authenticate(user: client.consumerKey!, password: client.consumerSecret!)
            .responseJSON { response in
                if response.result.isSuccess {
                    let customer = Mapper<Customer>().map(response.result.value!["customer"])
                    completion(success: true, customer: customer)
                } else {
                    completion(success: false, customer: nil)
                }
        }
    }
}