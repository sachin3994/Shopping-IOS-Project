//
//  ProductDetail.swift
//  EducationiOS
//
//  Created by MacStudent on 2017-07-20.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit
import CoreData


class ProductDetail: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var desc: UILabel!
    var name1=""
    var type1=""
    var company1=""
    var price1=""
    var desc1=""
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text=name1
        type.text=type1
        company.text=company1
        price.text=price1
        desc.text=desc1
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addToCart(_ sender: Any) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Items",
                                       in: managedContext)!
        
        let productData = NSManagedObject(entity: entity,
                                      insertInto: managedContext)
        
        // 3
        productData.setValue(name1, forKeyPath: "name")
        productData.setValue(type1, forKeyPath: "type")
        productData.setValue(company1, forKeyPath: "company")
        productData.setValue(Double(price1), forKeyPath: "price")
        productData.setValue(desc1, forKeyPath: "disc")
        
        // 4
        do {
            try managedContext.save()
            print("Record Inserted")
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
       let alertController = UIAlertController(title: "Message", message: "Item added to cart", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)

    }
    @IBAction func onClickViewCart(_ sender: Any) {
        //self.performSegue(withIdentifier: "toCart", sender: self)
       let vc = storyboard?.instantiateViewController(withIdentifier: "cartItems1") as! CartItems;
        self.navigationController?.pushViewController(vc, animated: false)
    }

}
