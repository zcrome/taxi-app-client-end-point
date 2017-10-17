//
//  Services.swift
//  taxi-app-taxi-end-point
//
//  Created by zcrome on 10/15/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class Services{
  static let sharedInstance = Services()
  private init(){}
  
  
  private let BASE_IP = "http://localhost"
  private let PORT = "3000"
  
  private let URL_API_CLIENT = "/api/Clients"
  private let URL_API_LOGIN = "/login"
  
  
  
  
  func executeClientLoginWith(Credentials credentials: [String:Any], AndObtain callback: @escaping (_ response: Bool) -> Void){
    Alamofire.request("\(BASE_IP):\(PORT)\(URL_API_CLIENT)\(URL_API_LOGIN)", method: .post, parameters: credentials).responseJSON { response in
      guard let data = response.data else{
        callback(false)
        return
      }
      print("******************************************")
      print(JSON(data: data))
      print("******************************************")
      Session.sharedInstance.client = Client(TaxiJSON: JSON(data: data))
      callback(Session.sharedInstance.setTokenWith(JSON: JSON(data: data)))
    }
  }
  
  func executeRegistrationOf(Client client: [String: Any],AndObtain callback: @escaping (_ response: (status: Bool, clientId: String?))->Void){
    Alamofire.request("\(BASE_IP):\(PORT)\(URL_API_CLIENT)", method: .post, parameters: client).responseJSON { response in
      guard let data = response.data else{
        callback((status: false, clientId: nil))
        return
      }
      print("******************************************")
      print(JSON(data: data))
      print("******************************************")
      let json = JSON(data: data)
      if let id = json["id"].int{
        callback((status: true, clientId: String(id)))
        return
      }
      callback((status: false, clientId: nil))
    }
  }
  
  
  
  
  
  
}
