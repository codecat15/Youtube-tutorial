//
//  ViewController.swift
//  DWIDemo
//
//  Created by CodeCat15 on 1/27/21.
//

import UIKit

/**

 Please navigate to the view controller extension for the code shown in the video.

 */

class ViewController: UIViewController  {

    let animals: [String] = ["Lion","Tiger","Cat","Bear"]
    var searchedAnimal: [String] = []

    var searching = false
    lazy var resource : AnimalResource = AnimalResource()
    var workItemReference : DispatchWorkItem? = nil

    @IBOutlet weak var tblAnimal: UITableView!
    @IBOutlet weak var srcAnimal: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
