// Task 2: Async Calculator App
// Name: Biruk Mulugeta

import 'dart:async';

class Calculator {
  final String name;

  // Bonus: store calculation history
  final List<String> history = [];

  // Named constant to avoid magic numbers
  static const Duration delay = Duration(seconds: 1, milliseconds: 500);

  Calculator(this.name);

  // -------------------------
  // Synchronous operations
  // -------------------------

  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Cannot divide by zero.");
    }

    return a / b;
  }

  // -------------------------------------------------
  // Asynchronous computation with simulated delay
  // -------------------------------------------------
  Future<double> computeAsync(double a, double b, String operation) async {
    double result;

    switch (operation) {
      case "add":
        result = add(a, b);
        break;

      case "subtract":
        result = subtract(a, b);
        break;

      case "multiply":
        result = multiply(a, b);
        break;

      case "divide":
        result = divide(a, b);
        break;

      default:
        throw ArgumentError("Unknown operation: $operation");
    }

    await Future.delayed(delay);

    history.add("$operation($a, $b) = $result");

    return result;
  }

  // -------------------------------------------------
  // Displays result and handles errors gracefully
  // -------------------------------------------------
  Future<void> displayResult(double a, double b, String operation) async {
    try {
      final result = await computeAsync(a, b, operation);

      print("$operation($a, $b) = $result");
    } catch (e) {
      print("Error: $e");
    }
  }

  // -------------------------------------------------
  // Bonus: Print calculation history
  // -------------------------------------------------
  void printHistory() {
    print("\nCalculation History");
    print("--------------------");

    for (String record in history) {
      print(record);
    }
  }
}

Future<void> main() async {
  final calc = Calculator("MyCalculator");

  print("--- ${calc.name} ---");

  await calc.displayResult(10, 4, "add");
  await calc.displayResult(10, 4, "subtract");
  await calc.displayResult(10, 4, "multiply");
  await calc.displayResult(10, 4, "divide");
  await calc.displayResult(15, 3, "divide");

  // Demonstrate error handling
  await calc.displayResult(10, 0, "divide");

  calc.printHistory();

  print("\nAll calculations complete.");
}

/*

===============================
Conceptual Questions
===============================

Q6:

A synchronous function runs from start to finish before the program
continues to the next instruction. An asynchronous function allows
the program to perform other work while waiting for a task to finish.
In the Calculator class, divide() is synchronous because the math
operation happens instantly. computeAsync() is asynchronous because
it simulates a delay using Future.delayed(), representing a real
network request or database call.

Q7:

The await keyword pauses the execution of the current async function
until the Future completes and returns its result. If await is not
used, the program will not wait for the result and will instead
return a Future object. In that case, the program would print
something like "Instance of 'Future<double>'" instead of the
actual numerical result.

Q8:

The try-catch block prevents the program from crashing when an
exception occurs. In displayResult(), it catches errors such as
division by zero and prints a friendly message. If the try-catch
block were removed and divide-by-zero occurred, the program would
terminate with a runtime exception.

Q9:

Throwing an ArgumentError is good design because it clearly signals
that the input provided to the function is invalid. Instead of
hiding the problem inside the function, the error is passed to the
caller so it can decide how to handle it. This follows the principle
of separation of concerns and makes the function more reusable.

Q10:

The async keyword on main() allows the program to use the await
keyword inside it. Without marking main() as async, we would not be
able to wait for asynchronous operations to finish before continuing
execution. Although the assignment could technically be written
without making main() async by using .then() callbacks, using async
and await makes the code easier to read and understand.

*/
