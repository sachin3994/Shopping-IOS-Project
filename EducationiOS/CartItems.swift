//
//  CartItems.swift
//  EducationiOS
//
//  Created by Manraj singh on 2017-07-24.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase
class CartItems: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var ref1: DatabaseReference!
    var done = false;
var allProducts: [NSManagedObject] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref1 = Database.database().reference().child("Purchased").child("ordered Item");
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
        
        let student = NSManagedObject(entity: entity,
                                      insertInto: managedContext)

        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Items")
        
        //3
        
        do {
            allProducts = try managedContext.fetch(fetchRequest)
            
            /*for m in allProducts
            {
                print((m as! Items).name!)
            }*/
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProducts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let u = allProducts[indexPath.row] as! Items
        cell.textLabel?.text = u.name
        //cell.imageView?.image = UIImage(contentsOfFile: "icons8-Calendar-50")
        
        return cell;
        

        
    }

    @IBAction func checkout(_ sender: Any)
    {
        let alertController = UIAlertController(title: "Message", message: "Do You want to continue??", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { action in self.check() })
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
        
        
        
        
        
    }
    func check()
    {
        ref1 = Database.database().reference().child("Purchased").child(ref1.childByAutoId().key);
        for index in 0..<allProducts.count
        {
            let u = allProducts[index] as! Items
            
            var pName = u.name
            var pCompany = u.company
            var pType = u.type
            var pPrice = u.price
            var pDescription = u.disc
            
            let key = ref1.childByAutoId().key
            let name = pName
            let data = ["id":key,
                        "productName":pName,
                        "productCompany": pCompany,
                        "productType": pType,
                        "productPrice": pPrice,
                        "productDescription": pDescription,
                        "productImage": ""
                
                ] as [String : Any]
            ref1.child(key).setValue(data)
            print("Added")
            done = true;
            
            
            
        }
        if (done == true)
        {
            
            
            deleteUser()
            
            
            let alertController = UIAlertController(title: "Message", message: "Purchased", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { action in self.performSegue(withIdentifier: "back", sender: self) })
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        }
        
    }
    func deleteUser () {
        
        let context = getContext()
        
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Items> = Items.fetchRequest()
        
        do {
            //go get the results
            let array_users = try getContext().fetch(fetchRequest)
            
            //You need to convert to NSManagedObject to use 'for' loops
            for user in array_users as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                context.delete(user)
            }
            //save the context
            
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            } catch {
                
            }
            
        } catch {
            print("Error with request: \(error)")
        }
    }
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

}
