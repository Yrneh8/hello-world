import Foundation

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func greet() {
        print("Hello, my name is \(name) and I am \(age) years old.")
    }
}

// Creating an instance of Person
let person = Person(name: "John", age: 25)

// Calling the greet method
person.greet()
