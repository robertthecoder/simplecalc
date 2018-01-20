//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

open class Calculator {
    open func calculate(_ args: [String]) -> Int {
        var sum: Int = 0;
        
        if (args.indices.contains(1)) {
            // Basic Calculations:
            if (args[1] == "+") {
                sum = Int(args[0])! + Int(args[2])!
            } else if (args[1] == "-") {
                sum = Int(args[0])! - Int(args[2])!
            } else if (args[1] == "*") {
                sum = Int(args[0])! * Int(args[2])!
            } else if (args[1] == "/") {
                sum = Int(args[0])! / Int(args[2])!
            } else if (args[1] == "%") {
                sum = Int(args[0])! % Int(args[2])!
            }
        }
        
        
        
        // Information about Input:
        if (args[args.count - 1] == "count") {
            return args.count - 1;
        
        } else if (args[args.count - 1] == "avg") {
            var avg = 0;
            
            if (args.count >= 2) {
                for index in 0...args.count - 2 {
                    avg = avg + Int(args[index])!;
                }
            }
            
            if ((args.count - 1) > 0) {
                avg = avg / (args.count - 1);
            }
            return avg;
        } else if (args[args.count - 1] == "fact") {
            var factorial = 1;
            
            if ((args.count - 1) > 1) {
                for index in 1...Int(args.count - 1) {
                    factorial = factorial * index;
                }
            }

            return factorial;
        }
        
        return sum;
    }
    
    open func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")

let first = readLine()!

if (first == "avg" || first == "count" || first == "fact") {
    print(0)
} else {
    let operation = readLine()!
    
    // If asking for avg on index 1
    if (operation == "avg") {
        print(first)
//    } else if (operation == "fact") {
//        var factorial = 1;
//
//        if (first == "0") {
//            print(1)
//        } else {
//            for index in 1...Int(first)! {
//                factorial = factorial * index;
//            }
//
//            print(factorial)
//        }
       
    } else {
        let second = readLine()!
        var array = [first, operation, second]
        
        // For the calculations:
        if (operation == "+") || (operation == "-") || (operation == "*") || (operation == "/") || (operation == "%") {
            print(Calculator().calculate(array))
            // For getting information about the #'s
        } else if (first == "avg") {
            print("0")
        } else {
            var temp = readLine()!
            array.append(temp);
            
            while (array[array.count - 1] != "count") && (array[array.count - 1] != "avg") && (array[array.count - 1]  != "fact") {
                temp = readLine()!
                array.append(temp);
            }
            
            print(Calculator().calculate(array))
        }
    }
}




