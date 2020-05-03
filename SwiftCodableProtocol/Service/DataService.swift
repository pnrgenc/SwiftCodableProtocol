//
//  CurrencyService.swift
//  SwiftCodableProtocol
//
//  Created by Pınar Genç on 3.05.2020.
//  Copyright © 2020 Pınar Genç. All rights reserved.
//

import Foundation

struct CurrencyService{
    func downloadCurrency(url: URL, completion: @escaping(Model?) -> ()){
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print(error.localizedDescription)
            completion(nil)
        }
        else if let data = data{
            let dataList = try?  JSONDecoder().decode(Model.self, from: data)
            if let dataList = dataList{
                // print("downloaded...\(dataList)")
                completion(dataList)
            }
        }
    }.resume()
}
}
