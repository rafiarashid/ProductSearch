//
//  NetworkService.swift
//  ProductApp
//
//  Created by Rafia on 21/10/2022.
//

import Foundation
import Toast_Swift
import FirebaseDatabase

class NetworkService {
    typealias CompletionHandler = (_ success: Bool) -> Void
    func fetchProducts() {
        let urlString = Utils.getBaseURL()
        performRequest(urlString: urlString, completionHandler: { success in
            if(success) {
                print("successful")
            } else {
                print("failed")
            }
        })
    }
    
    func performRequest(urlString: String, completionHandler: CompletionHandler) {
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error)
                    return
                }
                if let prodData = data {
                    if let productIds = self.parseJSON(prodData) {
                        let rootRef = Database.database().reference()
                        let ref = rootRef.child("\(productIds[0])")

                        print(ref)
                        
                        
                        ref.observe(.value, with: { snapshot in
                          // This is the snapshot of the data at the moment in the Firebase database
                          // To get value from the snapshot, we user snapshot.value
                          print(snapshot.value as Any)
                            print("ref printed")
                        })

                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ productData: Data) -> [String]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Array<String>.self, from: productData)
            //print(decodedData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
        return nil
    }
}
