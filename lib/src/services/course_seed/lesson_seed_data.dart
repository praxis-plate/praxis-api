import 'package:praxis_server/src/services/course_seed/course_seed_models.dart';

class LessonSeedData {
  static List<LessonSeed> getLessonsForModule(String moduleTitle) {
    switch (moduleTitle) {
      case 'Variables and Data Types':
        return _variablesLessons();
      case 'Functions':
        return _functionsLessons();
      case 'Loops and Iteration':
        return _loopsLessons();
      case 'Conditionals':
        return _conditionalsLessons();
      case 'Object-Oriented Programming':
        return _oopLessons();
      default:
        return [];
    }
  }

  static List<LessonSeed> _variablesLessons() {
    return const [
      LessonSeed(
        title: 'Introduction to Variables',
        contentText:
            '''Variables are containers for storing data values. In programming, you declare a variable to hold information that can change during program execution.

Key concepts:
- Variable declaration and initialization
- Naming conventions
- Variable scope
- Mutable vs immutable variables

Example in Dart:
```dart
var name = 'Alice';
int age = 25;
final String city = 'New York';
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 0,
        durationMinutes: 15,
      ),
      LessonSeed(
        title: 'Primitive Data Types',
        contentText:
            '''Primitive data types are the basic building blocks of data in programming. They represent simple values.

Common primitive types:
- int: whole numbers (1, 42, -10)
- double: decimal numbers (3.14, -0.5)
- bool: true or false
- String: text ("Hello", 'World')

Example:
```dart
int count = 10;
double price = 19.99;
bool isActive = true;
String message = 'Hello World';
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 1,
        durationMinutes: 20,
      ),
      LessonSeed(
        title: 'Type Conversion',
        contentText:
            '''Type conversion allows you to change data from one type to another. This is essential when working with different data types.

Types of conversion:
- Implicit conversion (automatic)
- Explicit conversion (manual casting)
- Parsing strings to numbers
- Converting numbers to strings

Example:
```dart
String numStr = '42';
int num = int.parse(numStr);
double decimal = num.toDouble();
String back = decimal.toString();
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 2,
        durationMinutes: 18,
      ),
      LessonSeed(
        title: 'Constants and Final Variables',
        contentText:
            '''Constants are values that cannot be changed after initialization. They help prevent bugs and make code more maintainable.

Key differences:
- const: compile-time constant
- final: runtime constant
- var: mutable variable

Example:
```dart
const double PI = 3.14159;
final DateTime now = DateTime.now();
var counter = 0;
counter++;
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 3,
        durationMinutes: 15,
      ),
      LessonSeed(
        title: 'Variable Scope',
        contentText:
            '''Variable scope determines where a variable can be accessed in your code. Understanding scope prevents errors and improves code organization.

Scope types:
- Global scope: accessible everywhere
- Local scope: accessible within a block
- Function scope: accessible within a function
- Class scope: accessible within a class

Example:
```dart
var global = 'I am global';

void myFunction() {
  var local = 'I am local';
  print(global);
  print(local);
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 4,
        durationMinutes: 20,
      ),
    ];
  }

  static List<LessonSeed> _functionsLessons() {
    return const [
      LessonSeed(
        title: 'Function Basics',
        contentText:
            '''Functions are reusable blocks of code that perform specific tasks. They help organize code and avoid repetition.

Function components:
- Function name
- Parameters (inputs)
- Return type
- Function body

Example:
```dart
int add(int a, int b) {
  return a + b;
}
```

Call it like this:
```dart
int result = add(5, 3); // 8
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 0,
        durationMinutes: 20,
      ),
      LessonSeed(
        title: 'Parameters and Arguments',
        contentText:
            '''Parameters are variables in function definitions. Arguments are the actual values passed to functions.

Types of parameters:
- Required parameters
- Optional positional parameters
- Named parameters
- Default values

Example:
```dart
void greet(String name, {String greeting = 'Hello'}) {
  print('\$greeting, \$name!');
}

greet('Alice'); // Hello, Alice!
greet('Bob', greeting: 'Hi'); // Hi, Bob!
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 1,
        durationMinutes: 25,
      ),
      LessonSeed(
        title: 'Return Values',
        contentText:
            '''Functions can return values to the caller. The return type specifies what kind of data is returned.

Return concepts:
- Return type declaration
- Returning values
- Early returns
- Void functions

Example:
```dart
String getFullName(String first, String last) {
  return '\$first \$last';
}

String fullName = getFullName('John', 'Doe');
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 2,
        durationMinutes: 18,
      ),
      LessonSeed(
        title: 'Scope and Closures',
        contentText:
            '''Functions create their own scope. Inner functions can access variables from outer scopes, creating closures.

Scope rules:
- Local variables are only accessible within their scope
- Inner functions can access outer variables
- Closures "remember" the environment

Example:
```dart
Function makeCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}

var counter = makeCounter();
print(counter()); // 1
print(counter()); // 2
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 3,
        durationMinutes: 22,
      ),
      LessonSeed(
        title: 'Arrow Functions',
        contentText:
            '''Arrow functions provide a concise syntax for functions that contain a single expression.

Syntax:
- Use => instead of { }
- Expression result is automatically returned
- Great for simple operations

Example:
```dart
int square(int x) => x * x;

List<int> numbers = [1, 2, 3];
var doubled = numbers.map((n) => n * 2).toList();
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 4,
        durationMinutes: 15,
      ),
    ];
  }

  static List<LessonSeed> _loopsLessons() {
    return const [
      LessonSeed(
        title: 'For Loops',
        contentText:
            '''For loops are used to repeat a block of code a specific number of times. They are ideal when you know how many iterations you need.

For loop structure:
- Initialization
- Condition
- Increment/Decrement

Example:
```dart
for (int i = 0; i < 5; i++) {
  print('Count: \$i');
}
```

For-each loop:
```dart
List<String> names = ['Alice', 'Bob', 'Charlie'];
for (String name in names) {
  print(name);
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 0,
        durationMinutes: 20,
      ),
      LessonSeed(
        title: 'While Loops',
        contentText:
            '''While loops repeat a block of code as long as a condition is true. Use them when you don't know the number of iterations in advance.

While loop example:
```dart
int count = 0;
while (count < 5) {
  print(count);
  count++;
}
```

Do-while loop:
```dart
int number = 0;
do {
  print(number);
  number++;
} while (number < 5);
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 1,
        durationMinutes: 18,
      ),
      LessonSeed(
        title: 'Loop Control Statements',
        contentText:
            '''Loop control statements allow you to alter the normal flow of loops.

Control statements:
- break: exits the loop
- continue: skips current iteration
- return: exits the function

Example:
```dart
for (int i = 0; i < 10; i++) {
  if (i == 5) break;
  if (i % 2 == 0) continue;
  print(i); // prints 1, 3
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 2,
        durationMinutes: 16,
      ),
      LessonSeed(
        title: 'Nested Loops',
        contentText:
            '''Nested loops are loops inside other loops. They are useful for working with multi-dimensional data structures.

Example:
```dart
for (int i = 1; i <= 3; i++) {
  for (int j = 1; j <= 3; j++) {
    print('\$i x \$j = \${i * j}');
  }
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 3,
        durationMinutes: 15,
      ),
      LessonSeed(
        title: 'Iteration Patterns',
        contentText:
            '''Iteration patterns help you process collections efficiently.

Common patterns:
- Map: transform each element
- Filter: select elements matching criteria
- Reduce: combine elements into a single value

Example:
```dart
List<int> numbers = [1, 2, 3, 4, 5];
var squares = numbers.map((n) => n * n).toList();
var evens = numbers.where((n) => n % 2 == 0).toList();
var sum = numbers.reduce((a, b) => a + b);
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 4,
        durationMinutes: 20,
      ),
    ];
  }

  static List<LessonSeed> _conditionalsLessons() {
    return const [
      LessonSeed(
        title: 'If-Else Statements',
        contentText:
            '''If-else statements allow your program to make decisions based on conditions.

Structure:
- if condition
- optional else if conditions
- optional else block

Example:
```dart
int score = 85;
if (score >= 90) {
  print('A');
} else if (score >= 80) {
  print('B');
} else {
  print('C');
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 0,
        durationMinutes: 18,
      ),
      LessonSeed(
        title: 'Switch Statements',
        contentText:
            '''Switch statements are an alternative to multiple if-else conditions when checking a single value.

Example:
```dart
String grade = 'B';

switch (grade) {
  case 'A':
    print('Excellent');
    break;
  case 'B':
    print('Good');
    break;
  default:
    print('Keep trying');
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 1,
        durationMinutes: 16,
      ),
      LessonSeed(
        title: 'Boolean Logic',
        contentText:
            '''Boolean logic uses true/false values and logical operators to build complex conditions.

Operators:
- && (AND)
- || (OR)
- ! (NOT)

Example:
```dart
bool hasTicket = true;
bool isAdult = false;

if (hasTicket && isAdult) {
  print('Can enter');
} else {
  print('Cannot enter');
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 2,
        durationMinutes: 14,
      ),
      LessonSeed(
        title: 'Comparison Operators',
        contentText:
            '''Comparison operators compare values and return boolean results.

Operators:
- == (equal)
- != (not equal)
- >, <, >=, <=

Example:
```dart
int a = 10;
int b = 20;

print(a == b); // false
print(a < b);  // true
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 3,
        durationMinutes: 12,
      ),
      LessonSeed(
        title: 'Ternary Operator',
        contentText:
            '''The ternary operator provides a shorthand way to write simple if-else statements.

Syntax:
condition ? valueIfTrue : valueIfFalse

Example:
```dart
int age = 18;
String status = age >= 18 ? 'Adult' : 'Minor';
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 4,
        durationMinutes: 10,
      ),
    ];
  }

  static List<LessonSeed> _oopLessons() {
    return const [
      LessonSeed(
        title: 'Classes and Objects',
        contentText:
            '''Classes are blueprints for creating objects. Objects are instances of classes with their own data and behavior.

Example:
```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() {
    print('Hi, I am \$name and I am \$age years old.');
  }
}

var person = Person('Alice', 25);
person.introduce();
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 0,
        durationMinutes: 22,
      ),
      LessonSeed(
        title: 'Encapsulation',
        contentText:
            '''Encapsulation is the practice of hiding internal details and exposing only what is necessary.

Example:
```dart
class BankAccount {
  double _balance = 0;

  void deposit(double amount) {
    _balance += amount;
  }

  double get balance => _balance;
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 1,
        durationMinutes: 18,
      ),
      LessonSeed(
        title: 'Inheritance',
        contentText:
            '''Inheritance allows a class to inherit properties and methods from another class.

Example:
```dart
class Animal {
  void speak() {
    print('Animal sound');
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print('Bark');
  }
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 2,
        durationMinutes: 20,
      ),
      LessonSeed(
        title: 'Polymorphism',
        contentText:
            '''Polymorphism allows objects of different classes to be treated as objects of a common superclass.

Example:
```dart
void makeSound(Animal animal) {
  animal.speak();
}

makeSound(Dog()); // Bark
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 3,
        durationMinutes: 16,
      ),
      LessonSeed(
        title: 'Abstraction',
        contentText:
            '''Abstraction focuses on exposing only the necessary features of an object.

Example:
```dart
abstract class Shape {
  double area();
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}
```''',
        videoUrl: null,
        imageUrls: null,
        orderIndex: 4,
        durationMinutes: 18,
      ),
    ];
  }
}
