import 'package:praxis_server/src/services/course_seed/course_seed_models.dart';

class ModuleSeedData {
  static List<ModuleSeed> programmingFundamentals() {
    return const [
      ModuleSeed(
        title: 'Variables and Data Types',
        description:
            'Learn about variables, primitive data types, and how to store and manipulate data in your programs.',
        orderIndex: 0,
      ),
      ModuleSeed(
        title: 'Functions',
        description:
            'Master function declaration, parameters, return values, and scope. Learn to write reusable code.',
        orderIndex: 1,
      ),
      ModuleSeed(
        title: 'Loops and Iteration',
        description:
            'Understand for loops, while loops, and iteration patterns. Learn to process collections efficiently.',
        orderIndex: 2,
      ),
      ModuleSeed(
        title: 'Conditionals',
        description:
            'Learn if-else statements, switch cases, and boolean logic. Control program flow based on conditions.',
        orderIndex: 3,
      ),
      ModuleSeed(
        title: 'Object-Oriented Programming',
        description:
            'Explore classes, objects, inheritance, and polymorphism. Build modular and maintainable code.',
        orderIndex: 4,
      ),
    ];
  }
}
