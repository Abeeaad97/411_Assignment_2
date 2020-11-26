//
//  claimService.swift
//  411_Assignment_2
//
//  Created by Abid Bakhtiyar on 11/25/20.
//

import UIKit

struct claim : Codable {
    var t : String
    var d : String
    
    init(t_: String, d_ : String){
        t = t_
        d = d_
    }
}

class claimServ {
    var claimResp : String
    
    init() {
        claimResp = "Awaiting status report"
    }
    
    func addClaim(cObj : claim) {
        let requestUrl = "http://localhost:8060/claimServ/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(cObj)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: jsonData){
            (data, response, error) in
            if let resp = data {
                let responseStr = String(bytes: resp, encoding: .utf8)
                self.claimResp = "\(responseStr!)"
            }
            else if let responseErr = error {
                self.claimResp = "Server Error : \(responseErr)"
            }
        }
        task.resume()
    }
}
