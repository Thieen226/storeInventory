//
//  main.swift
//  storeInventory
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

var itemPrice : [String: Double] = [
    "cereal": 4.99,
    "milk" : 4.99,
    "syrup" : 3.99,
    "cups": 2.99]

var itemQuantity : [String: Int] = [
    "cereal": 100,
    "milk" : 100,
    "syrup" : 100,
    "cups": 100]

var total : Double = 0.0

var userCart : [String: Int] = [
    "cereal" : 0,
    "milk" : 0,
    "syrup" : 0,
    "cups" : 0]

let adminID : String = "1234"


//creating a variable to keep track when the user choose check out
var mainMenu : Bool = true

//when mainMenu is true the keeps running the menu of selection
while mainMenu{
    print("Welcome to the grocery store! Let us know how we can help you (Enter number of selection) \n"
          + "1. Add item to cart \n"
          + "2. Remove item from cart \n"
          + "3. Check if item is in stock \n"
          + "4. Admin menun \n"
          + "5. Checkout \n")

    //grab the userInput
    if let userInput = readLine(){
        switch userInput{
        
            //when the user choose option 1 then execute addToCartMenu() func
        case "1":
            addToCartMenu()
            
        case "2":
            print("What would you like to remove to cart? (Enter number of selection) \n"
                  + "1. Cereal \n"
                  + "2. Milk \n"
                  + "3. Syrup \n"
                  + "4. Cups \n"
            )
            
        case "3":
            print("What item would you like to check if it's in stock? (Enter number of selection) \n"
                  + "1. Cereal \n"
                  + "2. Milk \n"
                  + "3. Syrup \n"
                  + "4. Cups \n"
            )
            
        case "4":
            print("Enter Admin ID:")
            
        case "5":
            print("Thanks for shopping with us! \n"
                  + "You purchases the following: \n"
                  + "Cereals: 0 \n"
                  + "Milks: 0 \n"
                  + "Syrups: 0 \n"
                  + "Cups: 0 \n"
                  + "Your grand total including tax (9.25%) is: 0.00")
            mainMenu = false
            
        default:
            print("Please choose an appropriate option! \n"
                  + "Welcome to the grocery store! Let us know how we can help you (Enter number of selection) \n"
                  + "1. Add item to cart \n"
                  + "2. Remove item from cart \n"
                  + "3. Check if item is in stock \n"
                  + "4. Admin menun \n"
                  + "5. Checkout \n")
        }
        
    }
}

//creating a func for selecting item to add and add them to the cart
func addToCartMenu(){
    print("What would you like to add to cart? (Enter number of selection) \n"
          + "1. Cereal \n"
          + "2. Milk \n"
          + "3. Syrup \n"
          + "4. Cups \n"
    )
    
    if let userInput = readLine(){
        if userInput == "1"{
            print("How many cereal(s) would you like to add to cart?")
            //grab the quantity input and change it to integer
            if let quantity = readLine(), let number = Int(quantity){
                addItem(item: "cereal", quantity: number)
            }
        }
        else if userInput == "2"{
            print("How many milk(s) would you like to add to cart?")
            if let quantity = readLine(), let number = Int(quantity){
                addItem(item: "milk", quantity: number)
            }
        }
        else if userInput == "3"{
            print("How many syrup(s) would you like to add to cart?")
            if let quantity = readLine(), let number = Int(quantity){
                addItem(item: "syrup", quantity: number)
            }
        }
        else if userInput == "4"{
            print("How many cup(s) would you like to add to cart?")
            if let quantity = readLine(), let number = Int(quantity){
                addItem(item: "cup", quantity: number)
            }
            
            
        }
        
        func addItem(item: String, quantity: Int) {
            if item == "cereal"{
                userCart["cereal"]! += quantity
            }
            else if item == "milk"{
                userCart["milk"]! += quantity
            }
            else if item == "syrup"{
                userCart["syrup"]! += quantity
            }
            else if item == "cups"{
                userCart["cups"]! += quantity
            }
            
            print("You have added \(quantity) \(item)(s) to your cart \n"

        
    }
}
