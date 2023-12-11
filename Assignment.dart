// Interface for roles
abstract class Role {
  void displayRole();
}

// Class representing a person
class Person {
  // Attributes
  final String name;
  final int age;
  final String address;
  final Role role;

  // Constructor
  Person(this.name, this.age, this.address, this.role);

  // Implement the Role interface methods
  @override
  void displayRole() {
    role.displayRole();
  }
}

// Class representing a student
class Student extends Person {
  // Additional attributes
  final String studentID;
  final int grade;
  final List<double> courseScores;

  // Constructor
  Student(
      String name, int age, String address, Role role, this.studentID, this.grade,
      this.courseScores)
      : super(name, age, address, role);

  // Override the displayRole() method
  @override
  void displayRole() {
    print("Role: Student");
  }

  // Additional method
  double getAverageScore() {
    return courseScores.reduce((a, b) => a + b) / courseScores.length;
  }
}

// Class representing a teacher
class Teacher extends Person {
  // Additional attribute
  final String teacherID;
  final List<String> coursesTaught;

  // Constructor
  Teacher(String name, int age, String address, Role role, this.teacherID,
      this.coursesTaught)
      : super(name, age, address, role);

  // Override the displayRole() method
  @override
  void displayRole() {
    print("Role: Teacher");
  }

  // Additional method
  void showCoursesTaught() {
    print("Courses taught:");
    for (final course in coursesTaught) {
      print(course);
    }
  }
}

// Class representing student management system
class StudentManagementSystem {
  // Main method
  void run() {
    // Create student instance
    final student1 = Student(
        "John Doe", 20, "123 Main St.", StudentRole(), "ST1234", 12, [90, 85, 82]);

    // Create teacher instance
    final teacher1 = Teacher(
        "Mrs. Smith", 35, "456 Oak St.", TeacherRole(), "TC5678", ["Math", "English", "Bangla"]);

    // Display student information
    print("Student Information:");
    student1.displayRole();
    print("Name: ${student1.name}");
    print("Age: ${student1.age}");
    print("Address: ${student1.address}");
    print("Average Score: ${student1.getAverageScore()}");

    // Display teacher information
    print("\nTeacher Information:");
    teacher1.displayRole();
    print("Name: ${teacher1.name}");
    print("Age: ${teacher1.age}");
    print("Address: ${teacher1.address}");
    print("Courses Taught:");
    teacher1.showCoursesTaught();
  }
}

// Define roles as separate classes (optional)
class StudentRole implements Role {
  @override
  void displayRole() => print("Role: Student (from separate class)");
}

class TeacherRole implements Role {
  @override
  void displayRole() => print("Role: Teacher (from separate class)");
}

void main() {
  StudentManagementSystem().run();
}