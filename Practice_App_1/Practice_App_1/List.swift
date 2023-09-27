//
//  List.swift
//  Practice_App_1
//
//  Created by Selvaguru K on 9/24/23.
//

import Foundation
public class List<T> {
        private var head: Linked_List<T>?
        
        public var isEmpty: Bool {
            return head == nil
        }
        //Append values to the linked list
        public func append(_ value: T){
            let newNode = Linked_List(item: value)
            
            if isEmpty{
                head = newNode
            }
            else {
                var currentNode = head
                while currentNode?.next != nil{
                    currentNode = currentNode?.next
                }
                currentNode?.next = newNode
            }
        }
        //print all the list
      public func print_All()-> [T]{
            var arr = [T]()
            var start = head
            while start != nil{
                arr.append(start!.item)
                start = start?.next
            }
            return arr
        }
    
    public func print_First()-> Linked_List<T>{
        return head ?? <#default value#>
    }
    }
