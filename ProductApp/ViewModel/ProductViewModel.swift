//
//  ProductViewModel.swift
//  ProductApp
//
//  Created by Rafia on 26/10/2022.
//

import Foundation
import FirebaseDatabase

final class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func listentoRealtimeDatabase() {
        guard let databasePath = databasePath else {
            return
        }
        databasePath
            .observe(.childAdded) { [weak self] snapshot in
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                json["id"] = snapshot.key
                do {
                    let productData = try JSONSerialization.data(withJSONObject: json)
                    let product = try self.decoder.decode(Product.self, from: productData)
                    self.products.append(product)
                } catch {
                    print("an error occurred", error)
                }
            }
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}
