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

//creating a variable to keep track and show options in the grocery store until the user choose check out
var mainMenu : Bool = true

//variable that keeps track if the user choose the item in the given option
var appropriateOption : Bool = true

//variable that shows admin menu options for the user after the user complete an option
var adminMenuIsTrue : Bool = true

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
            appropriateOption = true

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
                if let quantity = readLine(), let number = Int(quantity), number < itemQuantityInStock["cereal"]!{
                    addItem(item: "cereal", quantity: number)
                    //update the quantity after the user takes a certain amount of the item
                    itemQuantityInStock["cereal"]! -= userCart["cereal"]!
                }
                else{
                    print("The amount you want to add exceeds the quantity in the store")
                }
            }
            else if userInput == "2"{
                print("How many milk(s) would you like to add to cart?")
                if let quantity = readLine(), let number = Int(quantity), number < itemQuantityInStock["milk"]!{
                    addItem(item: "milk", quantity: number)
                    itemQuantityInStock["milk"]! -= userCart["milk"]!
                }
                else{
                    print("The amount you want to add exceeds the quantity in the store")
                }
            }
            else if userInput == "3"{
                print("How many syrup(s) would you like to add to cart?")
                if let quantity = readLine(), let number = Int(quantity), number < itemQuantityInStock["syrup"]!{
                    addItem(item: "syrup", quantity: number)
                    itemQuantityInStock["syrup"]! -= userCart["syrup"]!
                }
                else{
                    print("The amount you want to add exceeds the quantity in the store")
                }
            }
            else if userInput == "4"{
                print("How many cup(s) would you like to add to cart?")
                if let quantity = readLine(), let number = Int(quantity), number < itemQuantityInStock["cups"]!{
                    addItem(item: "cups", quantity: number)
                    itemQuantityInStock["cups"]! -= userCart["cups"]!
                }
                else{
                    print("The amount you want to add exceeds the quantity in the store")
                }
            }
            else{
                appropriateOption = true
                print("Please choose an appropriate option!")
            }
        }
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
                total += Double(quantity) * itemPrice[item]!
                print("You have added \(quantity) \(item)(s) to your cart \n"
                       + "Current total is: $ \(String(format : "%.2f", total))")

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
                //when the user don't have any items in their cart then alert them
                else if userCart["cereal"]! == 0{
                    print("You don't have any in your cart")
                }
                //when the user wants to remove more than what they have, alert this
                //then remove all the items in their cart and add them back to the stock
                //then reset the user's cart to 0
                else{
                    print("You don't have enough cereals to remove but I will remove all the cereals you currently have")
                    itemQuantityInStock["cereal"]! += userCart["cereal"]!
                    userCart["cereal"]! = 0
                }
            }
            else if userInput == "2"{
                print("How many milk(s) would you like to remove from cart?")
                if let quantity = readLine(), let number = Int(quantity), number < userCart["milk"]!{
                    removeItem(item: "milk", quantity: number)
                }
                else if userCart["milk"]! == 0{
                    print("You don't have any in your cart")
                }
                else{
                    print("You don't have enough milks to remove but I will remove all the milks you currently have")
                    itemQuantityInStock["milk"]! += userCart["milk"]!
                    userCart["milk"]! = 0
                }
            }
            else if userInput == "3"{
                print("How many syrup(s) would you like to remove from cart?")
                if let quantity = readLine(), let number = Int(quantity), number < userCart["syrup"]!{
                    removeItem(item: "syrup", quantity: number)
                }
                else if userCart["syrup"]! == 0{
                    print("You don't have any in your cart")
                }
                else{
                    print("You don't have enough syrups to remove but I will remove all the syrups you currently have")
                    itemQuantityInStock["syrup"]! += userCart["syrup"]!
                    userCart["syrup"]! = 0
                }
            }
            else if userInput == "4"{
                print("How many cup(s) would you like to remove from cart?")
                if let quantity = readLine(), let number = Int(quantity), number < userCart["cups"]!{
                    removeItem(item: "cups", quantity: number)
                }
                else if userCart["cups"]! == 0{
                    print("You don't have any in your cart")
                }
                else{
                    print("You don't have enough cups to remove but I will remove all the cups you currently have")
                    itemQuantityInStock["cups"]! += userCart["cups"]!
                    userCart["cups"]! = 0
                }
            }
            else{
                appropriateOption = true
                print("Please choose an appropriate option!")
            }
        }
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
        total -= Double(quantity) * itemPrice[item]!
        print("You have removed \(quantity) \(item)(s) from your cart \n"
              + "Current total is: $ \(String(format : "%.2f", total))")
}

func checkItemInStock(){
    print("What item would you like to check if it's in stock? \n"
          + "1. Cereal \n"
          + "2. Milk \n"
          + "3. Syrup \n"
          + "4. Cups")
    
    if let userInput = readLine(){
        //grab the quantity of the item that the user chose
        if userInput == "1"{
            print("There are currently \(itemQuantityInStock["cereal"]!) cereals in stock")
        }
        else if userInput == "2"{
            print("There are currently \(itemQuantityInStock["milk"]!) milks in stock")
        }
        else if userInput == "3"{
            print("There are currently \(itemQuantityInStock["syrup"]!) syrups in stock")
        }
        else if userInput == "4"{
            print("There are currently \(itemQuantityInStock["cups"]!) cups in stock")
        }
    }
}

//function that displays admin menu options
func adminMenu(){
    print("Enter Admin ID:")
    if let userInput = readLine(){
        if userInput == adminID{
            adminMenuIsTrue = true
        }
        else{
            print("You have entered incorrect ID number")
            return //return to the normal menu if the user enter incorrect ID number
        }
        while adminMenuIsTrue{
            print("Welcome to the Admin menu! Let's us know how we can help you (Enter number of selection) \n"
                  + "1. Restock inventory \n"
                  + "2. Generate report \n"
                  + "3. Check number of items \n"
                  + "4. Quit admin menu")
            
            if let adminInput = readLine(){
                if adminInput == "1"{
                    print("What would you like to restock? (Enter number of selection) \n"
                          + "1. Cereal \n"
                          + "2. Milk \n"
                          + "3. Syrup \n"
                          + "4. Cups")
                    readLineRestock()
                }
                else if adminInput == "2"{
                    
                    //variable that keeps track of the total quantity in stock by adding all the item's quantity together
                    let totalQuantityInStock = itemQuantityInStock["cereal"]! + itemQuantityInStock["milk"]! + itemQuantityInStock["syrup"]! + itemQuantityInStock["cups"]!
                    
                    print("Summary Report: \n"
                          + "Remaining cereals: \(itemQuantityInStock["cereal"]!) \n"
                          + "Remaining milks: \(itemQuantityInStock["milk"]!) \n"
                          + "Remaining syrup: \(itemQuantityInStock["syrup"]!) \n"
                          + "Remaining cups: \(itemQuantityInStock["cups"]!) \n"
                          + "Remaining inventory: \(totalQuantityInStock) \n"
                          + "Total sales: $ \(String(format : "%.2f", total))")
                }
                else if adminInput == "3"{
                    checkItemInStock()
                }
                else if adminInput == "4"{
                    print("Returning to normal menu")
                    adminMenuIsTrue = false //make adminMenuIsTrue to false to stop displaying admin menu and return to normal menu
                }
            }
        }
    }
}

//create a function that read the input from the restock option
func readLineRestock(){
    if let inputRestock = readLine(){
        
        if inputRestock == "1"{
            print("How many units of cereal would you like to restock?")
            
            //grab the quantity input and change it to integer
            if let quantity = readLine(), let number = Int(quantity){
                restockItem(item: "cereal", quantity: number)
            }
        }
        else if inputRestock == "2"{
            print("How many units of milk would you like to restock?")
            
            //grab the quantity input and change it to integer
            if let quantity = readLine(), let number = Int(quantity){
                restockItem(item: "milk", quantity: number)
            }
        }
        else if inputRestock == "3"{
            print("How many units of syrup would you like to restock?")
            
            //grab the quantity input and change it to integer
            if let quantity = readLine(), let number = Int(quantity){
                restockItem(item: "syrup", quantity: number)
            }
        }
        else if inputRestock == "4"{
            print("How many units of cup would you like to restock?")
            
            //grab the quantity input and change it to integer
            if let quantity = readLine(), let number = Int(quantity){
                restockItem(item: "cups", quantity: number)
            }
        }
    }
}

//function that restock item that user choose
func restockItem(item: String, quantity: Int){
    
        if item == "cereal"{
            itemQuantityInStock["cereal"]! += quantity
            print("You have restocked \(quantity) units of cup")
        }
        else if item == "milk"{
            itemQuantityInStock["milk"]! += quantity
            print("You have restocked \(quantity) units of cup")
        }
        else if item == "syrup"{
            itemQuantityInStock["syrup"]! += quantity
            print("You have restocked \(quantity) units of cup")
        }
        else if item == "cups"{
            itemQuantityInStock["cups"]! += quantity
            print("You have restocked \(quantity) units of cup")
        }
    
}

func checkOut(){
        print("Thanks for shopping with us! \n"
              + "You purchases the following: \n"
              + "Cereals: \(userCart["cereal"]!) \n"
              + "Milks: \(userCart["milk"]!) \n"
              + "Syrups: \(userCart["syrup"]!) \n"
              + "Cups: \(userCart["cups"]!) \n"
              + "Your grand total including tax (9.25%) is: $ \(String(format: "%.2f", ((total * 0.0925) + total)))")
    }
