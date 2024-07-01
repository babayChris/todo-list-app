//
//  Extensions.swift
//  TodoGotchi
//
//  Created by Christopher Babayan on 6/26/24.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String: Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do{//handles error, if json DNE then returns an empty dictionary instead of error
            let json = try JSONSerialization.jsonObject(with: data) as? [String : Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
