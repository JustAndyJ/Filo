import Foundation

class Stock {
    var serialNumber: Int
    var next: Stock?

    init(serialNumber: Int) {
        self.serialNumber = serialNumber
        self.next = nil
    }
}

var cheese: Stock?

func callMenuStack() {
    var option = 0

    repeat {
        print("\n\nManager of stock:")
        print("1 - show products.")
        print("2 - add products.")
        print("3 - remove products.")
        print("4 - exit.")
        print("Type the option: ", terminator: "")

        if let input = readLine(), let inputOption = Int(input) {
            option = inputOption
        } else {
            print("Invalid input. Please enter a valid option.")
            option = 0
        }
    } while option < 0 || option > 4

    switch option {
    case 1: showStack()
    case 2: addElementStack()
    case 3: removeElementStack()
    case 4: break
    default: break
    }
}
func addElementStack() {
  print("\nEnter the serial number for the new product: ", terminator: "")
  if let input = readLine(), let serialNumber = Int(input) {
    let newStock =  Stock(serialNumber: serialNumber)
    newStock.next = cheese
    cheese = newStock
    print("Product added successfully.")
  } else {
    print("Invalid input. Please enter a valid serial number.")
  }
  callMenuStack()
}

func showStack() {
  var current = cheese
  
  while let element = current {
    print("element: ", element.serialNumber)
    current = element.next
  }
  callMenuStack()
}

func removeElementStack() {
    if let removedStock = cheese {
        print("\nProduct with serial number \(removedStock.serialNumber) removed.")
        cheese = removedStock.next
    } else {
        print("No products to remove.")
    }
  callMenuStack()
}

// Uso del menú de la pila
callMenuStack()
