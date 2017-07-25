//
//  ProductList.swift
//  EducationiOS
//
//  Created by Sachin on 7/19/17.
//  Copyright © 2017 MoxDroid. All rights reserved.
//

import UIKit

class ProductList: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    var pickerArray=["Iphone","Computer"]
    var index:Int=0;
    var obj=arrayFile()
    var arrayOfObjects=[arrayFile]()
    var arrayOfCart=[arrayFile]()
    var arraySelected="Iphone"
    var searchActive=false
    var filterArray=[arrayFile]()
    @IBOutlet weak var tableView1: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOfObjects=obj.getArray()
        print(arrayOfObjects.count)
        
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row==0
        {
            arraySelected="Iphone"
        }
        else{
            arraySelected="Computer"
        }
        tableView1.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive==false{
            return arrayOfObjects.count
        }
        else{
            return filterArray.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "myCell") as! customCell
        if searchActive==false{
            let obj1=arrayOfObjects[indexPath.row]
            if arraySelected=="Iphone"
            {
                cell.productImage.image=UIImage(named:obj1.image1)
                cell.productName.text=obj1.name1
                cell.productPrice.text="$"+String(obj1.price1)
            }
            else{
                cell.productImage.image=UIImage(named:obj1.image2)
                cell.productName.text=obj1.name2
                cell.productPrice.text="$"+String(obj1.price2)
            }
        }
        else if searchActive==true{
            let obj2=filterArray[indexPath.row]
            if arraySelected=="Iphone"
            {
                cell.productImage.image=UIImage(named:obj2.image1)
                cell.productName.text=obj2.name1
                cell.productPrice.text="$"+String(obj2.price1)
            }
            else{
                cell.productImage.image=UIImage(named:obj2.image2)
                cell.productName.text=obj2.name2
                cell.productPrice.text="$"+String(obj2.price2)
            }
            
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var name:String=""
        if searchActive==false{
            obj=arrayOfObjects[indexPath.row]
            if arraySelected=="Iphone"
            {
                name=obj.name1
            }
            else if arraySelected=="Computer"
            {
                name=obj.name2
            }
            let alert=UIAlertController(title: "Selected Product Is", message: name, preferredStyle: UIAlertControllerStyle.alert)
            let okbtn=UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
            {
                (UIAlertAction) -> Void in
                self.arrayOfCart.append(self.obj);
                print(self.arrayOfCart.count)
            }
            alert.addAction(okbtn)
            present(alert, animated: true, completion: nil)
            
        }
        else if searchActive==true{
            var name:String=""
            if searchActive==true{
                obj=filterArray[indexPath.row]
                if arraySelected=="Iphone"
                {
                    name=obj.name1
                }
                else if arraySelected=="Computer"
                {
                    name=obj.name2
                }
                let alert=UIAlertController(title: "Selected Product Is", message: name, preferredStyle: UIAlertControllerStyle.alert)
                let okbtn=UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                {
                    (UIAlertAction) -> Void in
                    self.arrayOfCart.append(self.obj);
                    print(self.arrayOfCart.count)
                }
                alert.addAction(okbtn)
                present(alert, animated: true, completion: nil)
            }
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty
        {
            searchActive=false
        }
        else{
            searchActive=true
            filterArray.removeAll()
            if arraySelected=="Iphone"
            {
                for index in 0..<arrayOfObjects.count
                {
                    let info=arrayOfObjects[index]
                    let cityname=info.name1.lowercased()
                    if (cityname.range(of: searchText.lowercased(), options: .regularExpression) != nil)
                    {
                        filterArray.append(info)
                    }
                }
            }
            else if arraySelected=="Computer"{
                for index in 0..<arrayOfObjects.count
                {
                    let info=arrayOfObjects[index]
                    let cityname=info.name2.lowercased()
                    if (cityname.range(of: searchText.lowercased(), options: .regularExpression) != nil)
                    {
                        filterArray.append(info)
                    }
                }
                
            }

}
    self.tableView1.reloadData()
}
    
}
