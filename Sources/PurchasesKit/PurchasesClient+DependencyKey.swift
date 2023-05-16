import ComposableArchitecture
import Foundation
import RevenueCat

extension PurchasesClient: DependencyKey {
    public static let liveValue = PurchasesClient(
        canMakePayments: {
            Purchases.canMakePayments()
        },
        configure: { apiKey in
            Purchases.configure(with: .init(withAPIKey: apiKey))
        },
        customerInfo: {
            try await Purchases.shared.customerInfo()
        },
        products: { identifiers in
            let storeProducts = await Purchases.shared.products(Array(identifiers))
            let purchasableProducts = storeProducts.map { PurchasableProduct(storeProduct: $0) }
            return purchasableProducts
        },
        purchaseProduct: { product in
            try await Purchases.shared.purchase(product: product)
        },
        restorePurchases: {
            try await Purchases.shared.restorePurchases()
        }
    )

    public static let previewValue = PurchasesClient(
        canMakePayments: { true },
        configure: { _ in },
        customerInfo: { try await Task.never() },
        products: { _ in [] },
        purchaseProduct: { _ in try await Task.never() },
        restorePurchases: { try await Task.never() }
    )

    public static let testValue = PurchasesClient(
        canMakePayments: unimplemented("\(Self.self).canMakePayments", placeholder: false),
        configure: unimplemented("\(Self.self).configure"),
        customerInfo: unimplemented("\(Self.self).customerInfo"),
        products: unimplemented("\(Self.self).products"),
        purchaseProduct: unimplemented("\(Self.self).purchaseProduct"),
        restorePurchases: unimplemented("\(Self.self).restorePurchases")
    )
}
