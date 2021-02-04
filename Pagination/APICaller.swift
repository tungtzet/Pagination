//
//  APICaller.swift
//  Pagination
//
//  Created by Tung Nguyen on 03.02.21.
//

import Foundation

class APICaller {
    public var isPaginating = false
    
    func fetchData(pagination: Bool = false, completion: @escaping (Result<[String], Error>) -> Void) {
        if pagination {
            isPaginating = true
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 3 : 2), execute: {
            let data = ["Apple", "Google", "Amazon", "Microsoft", "Monks", "Facebook", "Apple", "Google", "Amazon"]
            let newData = ["banana", "abc", "dgsdgdf"]
            completion(.success(pagination ? newData : data))
            if pagination {
                self.isPaginating = false
            }
        })
    }
}
