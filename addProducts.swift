//
//  addProducts.swift
//  EducationiOS
//
//  Created by MacStudent on 2017-07-19.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class addProducts: UIViewController {
var ref: DatabaseReference!
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productCompany: UITextField!
    @IBOutlet weak var productType: UITextField!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productDescription: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("products");

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onClickAdd(_ sender: Any) {
        var pName=productName.text
        var pCompany=productCompany.text
        var pType=productType.text
        var pPrice=productPrice.text
        var pDescription=productDescription.text
        
        let key = ref.childByAutoId().key
        let data = ["id":key,
                       "productName":pName,
                       "productCompany": pCompany,
                       "productType": pType,
                       "productPrice": pPrice,
                       "productDescription": pDescription,
                       "productImage": ""
            
        ]
        ref.child(key).setValue(data)
        print("Added")
        let alertController = UIAlertController(title: "Message", message: "One item added", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)

        

    }
    @IBAction func onClickFetch(_ sender: Any) {
        self.performSegue(withIdentifier: "toShowProduct", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
