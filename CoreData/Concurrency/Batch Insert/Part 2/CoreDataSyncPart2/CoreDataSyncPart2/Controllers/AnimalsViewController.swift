//
//  AnimalsViewController.swift
//  CoreDataSyncPart1
//
//  Created by CodeCat15 on 8/14/21.
//

import UIKit

class AnimalsViewController: UIViewController {

    var animals : Array<Animal>? = nil
    private let animalViewModel = AnimalViewModel()

    @IBOutlet weak var tblAnimal: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animalViewModel.getAnimalRecord {[weak self] animalRecords in
            DispatchQueue.main.async {
                if(animalRecords != nil && animalRecords?.count != 0){
                    self?.animals = animalRecords
                    self?.tblAnimal.reloadData()
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
