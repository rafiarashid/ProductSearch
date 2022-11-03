//
//  Utils.swift
//  ProductApp
//
//  Created by Rafia on 21/10/2022.
//

import Foundation



enum Constants: String {
    case baseURL = "http://35.154.26.203/product-ids"
}

enum ToastMessages: String {
    case invalidURL = "Oopsss!! The URL doesn't seem right"
}

class Utils {
    
    class func getBaseURL() -> String {
        return Constants.baseURL.rawValue
    }
}
