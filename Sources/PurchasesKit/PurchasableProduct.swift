import Foundation
import RevenueCat

public struct PurchasableProduct: Equatable, Hashable, Identifiable {
    public let localizedDescription: String
    public let localizedPriceString: String
    public let localizedTitle: String
    public let productIdentifier: String
    public var storeProduct: StoreProduct? = nil

    public var id: String { productIdentifier }

    public init(storeProduct: StoreProduct) {
        self.localizedDescription = storeProduct.localizedDescription
        self.localizedPriceString = storeProduct.localizedPriceString
        self.localizedTitle = storeProduct.localizedTitle
        self.productIdentifier = storeProduct.productIdentifier
        self.storeProduct = storeProduct
    }

    public init(
        localizedDescription: String,
        localizedPriceString: String,
        localizedTitle: String,
        productIdentifier: String
    ) {
        self.localizedDescription = localizedDescription
        self.localizedPriceString = localizedPriceString
        self.localizedTitle = localizedTitle
        self.productIdentifier = productIdentifier
    }
}
