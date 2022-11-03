//
//  Product.swift
//  ProductApp
//
//  Created by Rafia on 21/10/2022.
//

import Foundation
import UIKit

class Product: Identifiable, Codable {
    //all optionals to handle the possibility of null as mentioned in the task notes
    var name, description: String?
    var price: Int?
    var image: Data?
    
    init() {
        name = ""
        description = ""
        price = 0
        image = Data()
    }
}
