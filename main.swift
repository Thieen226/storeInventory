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

var itemQuantityInStock : [String: Int] = [
    "cereal": 100,
    "milk" : 100,
    "syrup" : 100,
    "cups": 100]

var total : Double = 0.0

var checkOutPrice : Double = 0.0

var userCart : [String: Int] = [
    "cereal" : 0,
    "milk" : 0,
    "syrup" : 0,
    "cups" : 0]

let adminID : String = "1234"


//creating a variable to keep track when the user choose check out
var mainMenu : Bool = true

//variable that keeps track if the user choose the item in the given option
var appropriateOption : Bool = true

//when mainMenu is true the keeps running the menu of selection
while mainMenu{
    print("Welcome to the grocery store! Let us know how we can help you (Enter number of selection) \n"
          + "1. Add item to cart \n"
          + "2. Remove item from cart \n"
          + "3. Check if item is in stock \n"
          + "4. Admin menu \n"
          + "5. Checkout \n")

    //grab the option that the user chose
    if let userInput = readLine(){
        switch userInput{
            //when the user choose option 1 then execute addToCartMenu() func
        case "1":
            addToCartMenu()
            
        case "2":
            //when the user choose option 2 then execute this func
            removeFromCartMenu()
            
            
        case "3":
            checkItemInStock()
            
        case "4":
            adminMenu()
            
        case "5":
            //when the user choose check out option, the main menu will be false to stop showing options in the beginning
            checkOut()
            mainMenu = false
            
        default:
            //if the user choose any number that not given in the options, this will show up
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
    while appropriateOption{
        print("What would you like to add to cart? (Enter number of selection) \n"
              + "1. Cereal \n"
              + "2. Milk \n"
              + "3. Syrup \n"
              + "4. Cups \n"
        )
        
        //grab the option the user chose
        if let userInput = readLine(){
            appropriateOption = false
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
                    addItem(item: "cups", quantity: number)
                }
            }
            else{
                appropriateOption = true
                print("Please choose an appropriate option!")
        }
    }
//add and update the quantity of the item that the user chose
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
                total += ((Double(quantity) * itemPrice[item]!) * 100).rounded()/100
                print("You have added \(quantity) \(item)(s) to your cart \n",
                      "Current total is: $ \(total)")

            }
            
        }
        
    }

func removeFromCartMenu(){
        appropriateOption = true
        while appropriateOption{
            print("What would you like to remove to cart? (Enter number of selection) \n"
                  + "1. Cereal \n"
                  + "2. Milk \n"
                  + "3. Syrup \n"
                  + "4. Cups \n"
            )
            if let userInput = readLine(){
                appropriateOption = false
                if userInput == "1"{
                    print("How many cereal(s) would you like to remove from cart?")
                    //grab the quantity input and change it to integer
                    if let quantity = readLine(), let number = Int(quantity), number < userCart["cereal"]!{
                        removeItem(item: "cereal", quantity: number)
                    }
                    else{
                        print("You don't have enough cereals to remove but I will remove all the cereals you currently have")
                        userCart["cereal"]! = 0
                    }
                }
                else if userInput == "2"{
                    print("How many milk(s) would you like to remove from cart?")
                    if let quantity = readLine(), let number = Int(quantity), number < userCart["milk"]!{
                        removeItem(item: "milk", quantity: number)
                    }
                    else{
                        print("You don't have enough milks to remove but I will remove all the milks you currently have")
                    }
                }
                else if userInput == "3"{
                    print("How many syrup(s) would you like to remove from cart?")
                    if let quantity = readLine(), let number = Int(quantity), number < userCart["syrup"]!{
                        removeItem(item: "syrup", quantity: number)
                    }
                    else{
                        print("You don't have enough syrups to remove but I will remove all the syrups you currently have")
                    }
                }
                else if userInput == "4"{
                    print("How many cup(s) would you like to remove from cart?")
                    if let quantity = readLine(), let number = Int(quantity), number < userCart["cups"]!{
                        removeItem(item: "cups", quantity: number)
                    }
                    else{
                        print("You don't have enough cups to remove but I will remove all the cups you currently have")
                    }
                }
                else{
                    appropriateOption = true
                    print("Please choose an appropriate option!")
                }
        }
        
    //remove and update the quantity that the user chose
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
            
            //calculate the total after removing certain amount of item and rounded it to 2 decimal
            total -= ((Double(quantity) * itemPrice[item]!)*100)/100
            print("You have removed \(quantity) \(item)(s) from your cart \n",
                    "Current total is: $ \(total)")
                
            }
            
        }
    }
    
func checkItemInStock(){
        appropriateOption = true
        while appropriateOption{
            print("What item would you like to check if it's in stock? \n"
                    + "1. Cereal \n"
                    + "2. Milk \n"
                    + "3. Syrup \n"
                    + "4. Cups")
        }
        if let userInput = readLine(){
            appropriateOption = false
            if userInput == "1"{
                print("There are currently \(userCart["cereal"]!) cereals in stock")
            }
        }
    }
    
    func adminMenu(){
        
    }
    
    func checkOut(){
        
    }

