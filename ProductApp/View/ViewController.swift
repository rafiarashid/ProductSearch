//
//  ViewController.swift
//  ProductApp
//
//  Created by Rafia on 21/10/2022.
//

import UIKit

class ViewController: UIViewController {
    var productNetworkManager = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()
        productNetworkManager.fetchProducts()
    }


}

