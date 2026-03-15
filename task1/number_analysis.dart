// Task 1: Number Analysis App
// Name: Biruk Mulugeta

// Returns the largest value in the list using a loop.
// If the list is empty, prints an error and returns 0.

int findMax(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error: Cannot find maximum of an empty list.");
    return 0;
  }

  int max = numbers[0];

  for (int n in numbers) {
    if (n > max) {
      max = n;
    }
  }

  return max;
}

// Returns the smallest value in the list using a loop.
// If the list is empty, prints an error and returns 0.

int findMin(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error: Cannot find minimum of an empty list.");
    return 0;
  }

  int min = numbers[0];

  for (int n in numbers) {
    if (n < min) {
      min = n;
    }
  }

  return min;
}

// Calculates the sum of all numbers in the list
// using the accumulator pattern.

int calculateSum(List<int> numbers) {
  int sum = 0;

  for (int n in numbers) {
    sum += n;
  }

  return sum;
}

// Calculates the average value of the list.
// This function calls calculateSum() to reuse logic.

double calculateAverage(List<int> numbers) {
  if (numbers.isEmpty) {
    print("Error: Cannot compute average of an empty list.");
    return 0.0;
  }

  int sum = calculateSum(numbers);
  return sum / numbers.length;
}

// Counts how many numbers in the list are negative.

int countNegatives(List<int> numbers) {
  int count = 0;

  for (int n in numbers) {
    if (n < 0) {
      count++;
    }
  }

  return count;
}

// Simple Bubble Sort implementation
// Returns a new sorted list (ascending)
// without using Dart's built-in sort().

List<int> bubbleSort(List<int> numbers) {
  List<int> sorted = List.from(numbers);

  for (int i = 0; i < sorted.length - 1; i++) {
    for (int j = 0; j < sorted.length - i - 1; j++) {
      if (sorted[j] > sorted[j + 1]) {
        int temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }

  return sorted;
}

//Built-in method versions for comparison

int findMaxBuiltIn(List<int> numbers) =>
    numbers.reduce((a, b) => a > b ? a : b);

int findMinBuiltIn(List<int> numbers) =>
    numbers.reduce((a, b) => a < b ? a : b);

int calculateSumBuiltIn(List<int> numbers) =>
    numbers.fold(0, (sum, n) => sum + n);

double calculateAverageBuiltIn(List<int> numbers) =>
    calculateSumBuiltIn(numbers) / numbers.length;

/*
Comparison Notes:

Manual loops are useful for learning and understanding
how algorithms work internally.

Built-in collection methods like reduce() and fold()
make the code shorter and easier to read, but they hide
the internal logic.

In real production code, developers often prefer built-in
methods because they are concise and optimized.
*/

void main() {
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  // Store results in variables
  final maxValue = findMax(numbers);
  final minValue = findMin(numbers);
  final sumValue = calculateSum(numbers);
  final avgValue = calculateAverage(numbers);
  final negativeCount = countNegatives(numbers);
  final sortedNumbers = bubbleSort(numbers);

  print("Number Analysis Results");
  print("========================");

  print("Numbers       : $numbers");
  print("Maximum value : $maxValue");
  print("Minimum value : $minValue");
  print("Sum           : $sumValue");
  print("Average       : $avgValue");
  print("Negatives     : $negativeCount");
  print("Sorted list   : $sortedNumbers");

  print("\nBuilt-in Method Comparison");
  print("---------------------------");

  print("Max (built-in) : ${findMaxBuiltIn(numbers)}");
  print("Min (built-in) : ${findMinBuiltIn(numbers)}");
  print("Sum (built-in) : ${calculateSumBuiltIn(numbers)}");
  print("Avg (built-in) : ${calculateAverageBuiltIn(numbers)}");
}

/*

===============================
Conceptual Questions
===============================

Q1:

A List<int> is a list that is only allowed to hold whole numbers. A
List<dynamic> is a list that can hold anything, like numbers, words,
or other objects. Using List<int> is better because it helps prevent
mistakes such as accidentally adding a string to a numeric list.
Typed lists also allow the Dart compiler to detect errors earlier
and optimize performance.

Q2:

In the findMax() function, the running maximum must be initialized
with the first element of the list. If we start with a number like
zero, it would cause incorrect results when all numbers in the list
are negative. For example, in the list [-5, -10, -20], the maximum
value should be -5. If the algorithm started with zero, it would
incorrectly report zero as the maximum even though zero is not in
the list.

Q3:

Calling calculateSum() from calculateAverage() demonstrates the
principle of code reuse. Instead of repeating the same summation
logic again inside calculateAverage(), we reuse the existing
function. This improves maintainability because if the sum logic
needs to change, it only needs to be updated in one place.

Q4:

A for-in loop allows the program to iterate through each element
in a list one by one without needing an index variable. In contrast,
a traditional for loop uses an index (like i) to access elements
by position. A for-in loop is preferred when you only need the
values in the list, while a traditional for loop is useful when
you need to know or modify the element’s position.

Q5:

If findMax() is called with an empty list, the program will crash
because it attempts to access numbers[0], which does not exist.
To handle this safely, the function should check if the list is
empty at the beginning and either return a default value or print
an error message to inform the user.

*/
