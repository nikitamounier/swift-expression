# swift-expression
Many languages such as Scala, Rust and Kotlin support using if/else and switch statements as expressions – meaning that they can by themselves return a value. Unfortunately, Swift is not one of these languages. Thankfully, Swift is powerful enough to let us express this at the μ-library level.

Initially, you would have to write this:
```swift
let number = 10

let fizzbuzz: String
switch (number % 3 == 0, number % 5 == 0) {
case (true, false):
    fizzbuzz = "Fizz"
case (false, true):
    fizzbuzz = "Buzz"
case (true, true):
    fizzbuzz = "FizzBuzz"
case (false, false):
    fizzbuzz = String(number)
}
```
This doesn't really feel like idiomatic Swift – we're not used to having uninitialized values floating around like this, and we need to remember to initialize the value on all paths. 

This library enables you to use if/else and switch statements as expressions, which lets you "return" the value directly. This is what it looks like:
```swift
let number = 10

let fizzBuzz = expression {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        "Fizz"
    case (false, true):
        "Buzz"
    case (true, true):
        "FizzBuzz"
    case (false, false):
        String(number)
    }
}
```
Looks much better, doesn't it? And all we had to do is wrap it in a lightweight `expression(_:)` call.

### What kind of sorcery is this?

No sorcery at all, actually! Implementing this took a grand total of **17 lines of code** (including skipped lines). Do to this we use [Result Builders](https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#ID630), which essentially allow you to turn trees of statements and expressions into a single result. 

You've probably already seen Result Builders in [SwiftUI](https://developer.apple.com/documentation/swiftui/viewbuilder), and you'll see them soon in the Standard Library with the still-in-the-pipeline [Pattern builder](https://forums.swift.org/t/declarative-string-processing-overview/52459#pattern-builder-9) for parsing like a regular expression. Check out other interesting uses of Result Builders in the [awesome-result-builders](https://github.com/carson-katri/awesome-result-builders) repository!
