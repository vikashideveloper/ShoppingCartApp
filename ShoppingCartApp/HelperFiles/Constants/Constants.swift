//
//  Constants.swift
//  ShoppingCartApp
//
//  Created by Vikash Kumar on 08/06/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import Foundation
import UIKit


//MARK: -
let _twitterUrl             = "https://api.twitter.com/1.1/account/verify_credentials.json"
let _twitterFriendsUrl      = "https://api.twitter.com/1.1/friends/list.json"
let _fbMeUrl                = "https://graph.facebook.com/me"
let _googleUrl              = "https://maps.googleapis.com/maps/api/place"

let _fbLoginReadPermissions = ["public_profile","email"]
let _fbUserInfoRequestParam = "email, first_name,  last_name, name, id, gender, picture.type(large)"

let _defaultCenter          = NotificationCenter.default
let _userDefault            = UserDefaults.standard
let _appDelegator           = UIApplication.shared.delegate! as! AppDelegate
let _application            = UIApplication.shared

let  screenSize             = UIScreen.main.bounds.size
let  heighRatio             = screenSize.height/667
let  widthRatio             = screenSize.width/375

//Local Date formatter
let dateFormator: DateFormatter = {
    let df = DateFormatter()
    df.locale = Locale(identifier: "zh_Hans")
    df.dateFormat = "dd-MMM-yyyy"
    return df
}()

//Server Date formatter
let serverDateFormat = "yyyy-MM-dd'T'HH:mm:ss"
var serverDateFormator: DateFormatter = {
    let df = DateFormatter()
    df.dateFormat = serverDateFormat
    df.timeZone = TimeZone(identifier: "UTC")
    return df
}()
