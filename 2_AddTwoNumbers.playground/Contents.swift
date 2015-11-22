/* 2. Add Two Numbers */

/*

You are given two linked lists representing two non-negative numbers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

*/

class ListNode {
    var value: Int = 0
    var next: ListNode?
    init(value: Int, next:ListNode? = nil) {
        self.value = value
        self.next = next
    }
    func description() -> String {
        var i: ListNode? = self
        var string = ""
        while(i != nil) {
            if string.characters.count > 0 {
                string += "->"
            }
            string += String(i!.value)
            i = i!.next
        }
        return string
    }
}

func addTwoNumbers(l1: ListNode, l2: ListNode) -> ListNode {
    var i = l1
    var j = l2
    
    var currentNode: ListNode!
    var frontNode: ListNode?
    var add1: Int = 0
    while i.value != 0 || j.value != 0 {
        currentNode = ListNode(value:(i.value + j.value + add1) % 10)
        add1 = (i.value + j.value + add1) / 10
        if let frontUnwrapped = frontNode {
            currentNode.next = frontUnwrapped
        }
        frontNode = currentNode
        i = i.next ?? ListNode(value: 0)
        j = j.next ?? ListNode(value: 0)

    }
    return currentNode
}


/// Test case

/*
    98713 + 287 = 99000

 3->1->7->8->9
 7->8->2

 9->9->0->0->0
*/

var node1 = ListNode(value: 9)
var node2 = ListNode(value: 8, next: node1)
var node3 = ListNode(value: 7, next: node2)
var node4 = ListNode(value: 1, next: node3)
var node5 = ListNode(value: 3, next: node4)
let l1 = node5

node1 = ListNode(value: 2)
node2 = ListNode(value: 8, next: node1)
node3 = ListNode(value: 7, next: node2)
let l2 = node3

print(addTwoNumbers(l1, l2: l2).description())








