//
//  ViewController.swift
//  DecodeStringResponse
//
//  Created by Ravi Dixit on 12/22/22.
//

import UIKit

class ViewController: UIViewController {

    private var productService: ProductService = ProductService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productService.getProducts()
    }
}

