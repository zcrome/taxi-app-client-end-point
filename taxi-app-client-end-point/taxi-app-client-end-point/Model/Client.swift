//
//  Client.swift
//  taxi-app-client-end-point
//
//  Created by zcrome on 10/16/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation
import SwiftyJSON

class Client: TypeOfUserProtocol{
  
  var id: String
  var name: String
  var lastName: String
  var phone: String
  var email: String
  let typeUseIs: TypeOfUser = .client
  var isValid: Bool{
    if id.isEmpty{
      return false
    }
    return true
  }
  
  init(name: String,
       lastName: String,
       phone: String,
       email: String) {
    self.name = name
    self.lastName = lastName
    self.phone = phone
    self.email = email
    self.id = ""
  }
  
  init(TaxiJSON json: JSON) {
    
    if let id = json["userId"].string{
      self.id = id
    }else{
      self.id = ""
    }
    
    if let name = json["name"].string{
      self.name = name
    }else{
      self.name = ""
    }
    
    if let lastName = json["lastName"].string{
      self.lastName = lastName
    }else{
      self.lastName = ""
    }
    
    if let phone = json["phone"].string{
      self.phone = phone
    }else{
      self.phone = ""
    }
    
    if let email = json["email"].string{
      self.email = email
    }else{
      self.email = ""
    }
  }

  
  
}
