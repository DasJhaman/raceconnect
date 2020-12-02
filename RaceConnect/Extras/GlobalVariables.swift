//
//  GlobalVariables.swift
//  OnlineMaid
//
//  Created by Ali Sher on 25/06/2020.
//  Copyright © 2020 Ali Sher. All rights reserved.
//

import UIKit

var isTesting: Bool = true
var DefaultCountryCode = "PK"
var PriceUnit = "$"
var DecimalOffset: Int = 2

//var db = DBHelper()
class CrossVariable: NSObject {
    
    @objc var isThe = GlobalVariables.CurrentView
    
}


class GlobalVariables: NSObject {

    
    public static var isLeftMenuVisible = false
    public static var CurrentView = UIViewController()
    
    //Errand Africa Google Key
    static var GoogleMapsKey: String =  ""
    static var BaseUrl: String =        "http://sh004.net/~gigs1wl9/"
    static var ImageBaseUrl: String =   "http://sh004.net/~gigs1wl9/"
    
    
    
    

    public static var AppColor = UIColor.init(red: 0.0/255.0, green:0.0/255.0, blue:0.0/255.0, alpha:1.0)
    
    
    public static var TitleFontColor = UIColor.init(red: 70.0/255.0, green:70.0/255.0, blue:70.0/255.0, alpha:1.0)
    
    
    public static var DarkGrayColor = UIColor.init(red: 120.0/255.0, green:120.0/255.0, blue:120.0/255.0, alpha:1.0)
    
    
    public static var LightGrayColor = UIColor.init(red: 137.0/255.0, green:137.0/255.0, blue:137.0/255.0, alpha:1.0)
    
    
    public static var PlaceHolderColor = UIColor.init(red: 170.0/255.0, green:170.0/255.0, blue:170.0/255.0, alpha:1.0)
    
    
    public static var LineAndSubViewsColor = UIColor.init(red: 225.0/255.0, green:225.0/255.0, blue:225.0/255.0, alpha:1.0)
    
    
    public static var RedColor = UIColor.init(red: 238.0/255.0, green:56.0/255.0, blue:64.0/255.0, alpha:1.0)
    
    
    public static var GreenColor = UIColor.init(red: 0.0/255.0, green:150.0/255.0, blue:50.0/255.0, alpha:1.0)
    
    
    public static var DefaultViewBackColor = UIColor.init(red: 235.0/255.0, green:235.0/255.0, blue:235.0/255.0, alpha:1.0)
    
}
