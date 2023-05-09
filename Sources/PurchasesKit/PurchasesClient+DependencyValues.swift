import ComposableArchitecture

extension DependencyValues {
    public var purchases: PurchasesClient {
        get { self[PurchasesClient.self] }
        set { self[PurchasesClient.self] = newValue }
    }
}
