import Foundation
import RevenueCat
import XCTestDynamicOverlay

public struct PurchasesClient {
    public var canMakePayments: @Sendable () async -> Bool
    public var configure: @Sendable (_ apiKey: String) async -> Void
    public var products: @Sendable (_ identifiers: Set<String>) async -> [PurchasableProduct]
    public var purchaseProduct: @Sendable (_ product: StoreProduct) async throws -> PurchaseResultData
    public var restorePurchases: @Sendable () async throws -> CustomerInfo
}
