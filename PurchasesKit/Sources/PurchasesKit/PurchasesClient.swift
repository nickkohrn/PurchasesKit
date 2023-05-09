import Foundation
import OSLog
import RevenueCat
import XCTestDynamicOverlay

public struct PurchasesClient {
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier!,
        category: String(describing: Self.self)
    )

    public var canMakePayments: @Sendable () async -> Bool
    public var configure: @Sendable (_ apiKey: String) async -> Void
    public var products: @Sendable (_ identifiers: Set<String>) async -> [PurchasableProduct]
    public var purchaseProduct: @Sendable (_ product: StoreProduct) async throws -> PurchaseResultData
}
