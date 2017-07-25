//
//  ShowProduct.swift
//  EducationiOS
//
//  Created by MacStudent on 2017-07-20.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ShowProduct: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var ref: DatabaseReference!
    var productList = [DataSnapshot]()
    var count=0;
    @IBOutlet weak var tableView1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("products");
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getProductList()
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "myCell2") as! customCell1
        
        
                    //getting values
                    let productObject =  productList[indexPath.row].value as? [String: AnyObject]
                    let id  = productObject?["id"]
                    let pName  = productObject?["productName"] as? String
                    let pPrice  = productObject?["productPrice"] as? String
                   // let pCompany = productObject?["productCompany"] as! String
        
        
                    cell.productName1.text=pName
                    cell.productPrice1.text=pPrice
                    cell.productImage1.image=UIImage(named:"iphone")
        

       
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "toDetails", sender: self)
        
        let productObject =  productList[indexPath.row].value as? [String: AnyObject]
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "productDetails") as! ProductDetail;
        
    
        vc.name1=(productObject?["productName"])! as! String
        vc.type1=(productObject?["productType"])! as! String
        vc.company1=(productObject?["productCompany"])! as! String
        vc.price1=(productObject?["productPrice"])! as! String
        vc.desc1=(productObject?["productDescription"])! as! String
        self.navigationController?.pushViewController(vc, animated: false)
        
       
        
        //self.present(vc, animated: false, completion: nil)
        
       
    }
    
    func getProductList()
    {
        ref.observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                
                //iterating through all the values
                self.productList =  snapshot.children.allObjects as! [DataSnapshot]
                self.tableView1.reloadData()
                
            }
        })
    

    }

}
