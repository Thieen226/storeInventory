//
//  main.swift
//  storeInventory
//
//  Created by StudentAM on 1/12/24.
//

import Foundation

//var name: String?

//if let name = readLine(){
//    //Use the name variable
//}
//else{
//    print("No name was entered")
//}

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

var totalPrice : Double = 0.0

//when mainMenu is true the keeps running the menu of selection
while mainMenu{
    print("Welcome to the grocery store! Let us know how we can help you (Enter number of selection) \n"
          + "1. Add item to cart \n"
          + "2. Remove item from cart \n"
          + "3. Check if item is in stock \n"
          + "4. Admin menu \n"
          + "5. Checkout \n")

    //grab the userInput
    if let userInput = readLine(){
        switch userInput{
            //when the user choose option 1 then execute addToCartMenu() func
        case "1":
            addToCartMenu()
            
        case "2":
            //when the user choose option 2 then execute this func
            removeFromCart()
            
            
        case "3":
            checkItemInStock()
            
        case "4":
            adminMenu()
            
        case "5":
            checkOut()
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
        else{
            print("Please choose an appropriate option! \n"
                  + "What would you like to add to cart? (Enter number of selection) \n"
                  + "1. Cereal \n"
                  + "2. Milk \n"
                  + "3. Syrup \n"
                  + "4. Cups \n")
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
            
            //calculate the total price and round it to 2 decimal places
            totalPrice = ((Double(quantity) * itemPrice[item]!) * 100).rounded()/100
            print("You have added \(quantity) \(item)(s) to your cart \n",
                  "Current total is: $ \(totalPrice)")
            
            //update and keep track the quantity of the item
            userCart[item]! += quantity
        }
            
    }
    
}

func removeFromCart(){
    print("What would you like to remove to cart? (Enter number of selection) \n"
          + "1. Cereal \n"
          + "2. Milk \n"
          + "3. Syrup \n"
          + "4. Cups \n"
    )
    
    if let userInput = readLine(){
        if userInput == "1"{
            print("How many cereal(s) would you like to remove from cart?")
            //grab the quantity input and change it to integer
            if let quantity = readLine(), let number = Int(quantity){
                removeItem(item: "cereal", quantity: number)
            }
        }
        else if userInput == "2"{
            print("How many milk(s) would you like to remove from cart?")
            if let quantity = readLine(), let number = Int(quantity){
                removeItem(item: "milk", quantity: number)
            }
        }
        else if userInput == "3"{
            print("How many syrup(s) would you like to remove from cart?")
            if let quantity = readLine(), let number = Int(quantity){
                removeItem(item: "syrup", quantity: number)
            }
        }
        else if userInput == "4"{
            print("How many cup(s) would you like to remove from cart?")
            if let quantity = readLine(), let number = Int(quantity){
                removeItem(item: "cup", quantity: number)
            }
        }
        else{
            print("Please choose an appropriate option! \n"
                  + "What would you like to remove cart? (Enter number of selection) \n"
                  + "1. Cereal \n"
                  + "2. Milk \n"
                  + "3. Syrup \n"
                  + "4. Cups \n")
        }
        
        func removeItem(item: String, quantity: Int) {
            if item == "cereal"{
                userCart["cereal"]! -= quantity
            }
            else if item == "milk"{
                userCart["milk"]! -= quantity
            }
            else if item == "syrup"{
                userCart["syrup"]! -= quantity
            }
            else if item == "cups"{
                userCart["cups"]! -= quantity
            }
            
            totalPrice = ((Double(userCart[item]!) * itemPrice[item]!)*100).rounded()/100
            print("You have removed \(quantity) \(item)(s) from your cart \n",
                  "Current total is: $ \(totalPrice)")
        }
    
    }
}

func checkItemInStock(){
    
}

func adminMenu(){
    
}

func checkOut(){
    
}
