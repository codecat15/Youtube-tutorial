//
//  HeroesVC.swift
//  lazyLoadingDemo
//
//  Created by CodeCat15 on 7/24/20.
//  Copyright © 2020 CodeCat15. All rights reserved.
//

import UIKit

class AnimalsVC: UIViewController {

    var animal: [Animal]? = nil
    let animalResource: AnimalResource = AnimalResource()
    @IBOutlet weak var tblAnimalList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        animalResource.getAnimals { (_animalResponse) in

            if(_animalResponse?.animals != nil)
            {
                self.animal = _animalResponse?.animals

                DispatchQueue.main.async {
                    self.tblAnimalList.reloadData()
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
