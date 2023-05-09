import ComposableArchitecture

extension DependencyValues {
    public var purchasesClient: PurchasesClient {
        get { self[PurchasesClient.self] }
        set { self[PurchasesClient.self] = newValue }
    }
}
