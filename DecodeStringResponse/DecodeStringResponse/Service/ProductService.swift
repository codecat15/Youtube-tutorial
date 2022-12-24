//Created by CodeCat15 on 12/23/22

import Foundation

/*
 
Hey there, I hope the session was helpful.
If you have any queries then please feel free to ask and if you think the content was helpful then please do consider sharing the channel with your iOS group.
 
Subscribe to the channel to stay upto date with the best coding practices in iOS programming.

 Regards
 Ravi
 */

struct ProductService {
    
    func getProducts() {
        let data = Data(Product.getProductJsonAsString().utf8)
        do {
            let result = try JSONDecoder().decode(Array<Product>.self, from: data)
            result.forEach { product in
                print(product.name)
                print(product.id)
                
                // Tip: You can also use dump to print the entire object uncomment the code and see the entire object being printed in the console. :)
                
                // dump(product)
                
            }
        }
        catch {
            debugPrint(error.localizedDescription)
        }
    }
}
