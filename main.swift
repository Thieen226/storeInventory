//
//  main.swift
//  SwiftPractice
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

print("Hello, World!")

var numbers: [Int] = [1, 2, 3, 5, 6, 4, 10]
for i in numbers.indices{
    print(numbers[i])
}

var num: [Int] = [1, 5, 3, 4, 2]
for num in num{
    print(num)
}

var number : Int = 0
while number <= 5{
    print("The current number is \(number)")
    number += 1
}
