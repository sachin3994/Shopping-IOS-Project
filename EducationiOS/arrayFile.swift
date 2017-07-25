//
//  arrayFile.swift
//  Sachin_C069413
//
//  Created by MacStudent on 2017-03-13.
//  Copyright © 2017 MacStudent. All rights reserved.
//

import Foundation
class arrayFile
{
    var image1=""
    var name1=""
    var price1:Int=0
    
    
    var image2=""
    var name2=""
    var price2:Int=0
    
    
    var arrayOfObjects=[arrayFile]()
    
    
    func getArray() -> [arrayFile] {
        let obj1=arrayFile()
        obj1.name1="Iphone 5"
        obj1.image1="iphone"
        obj1.price1=750
        obj1.name2="HP Laptop"
        obj1.image2="computer"
        obj1.price2=1050
        arrayOfObjects.append(obj1)
        
        let obj2=arrayFile()
        obj2.name1="Iphone 6"
        obj2.image1="iphone"
        obj2.price1=1000
        obj2.name2="Dell PC"
        obj2.image2="computer"
        obj2.price2=1100
        arrayOfObjects.append(obj2)
        
        let obj3=arrayFile()
        obj3.name1="Iphone 7"
        obj3.image1="iphone"
        obj3.price1=1200
        obj3.name2="Acer"
        obj3.image2="computer"
        obj3.price2=900
        arrayOfObjects.append(obj3)
        
        let obj4=arrayFile()
        obj4.name1="Galaxy S8"
        obj4.image1="galaxy"
        obj4.price1=1320
        obj4.name2="Mac Book Pro"
        obj4.image2="mac"
        obj4.price2=2100
        arrayOfObjects.append(obj4)
        
        let obj5=arrayFile()
        obj5.name1="Galaxy S6 Edge"
        obj5.image1="galaxy"
        obj5.price1=1000
        obj5.name2="Mac Book Air"
        obj5.image2="mac"
        obj5.price2=1500
        arrayOfObjects.append(obj5)
        
        return arrayOfObjects
    }
}
