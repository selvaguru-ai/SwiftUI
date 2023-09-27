//
//  Linked_List.swift
//  Practice_App_1
//
//  Created by Selvaguru K on 9/24/23.
//

import Foundation

public class Linked_List<T> {
    var item: T
    var next: Linked_List<T>?
    
    init(item: T){
        self.item = item
    }
}
