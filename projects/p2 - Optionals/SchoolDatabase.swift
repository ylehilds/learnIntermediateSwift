struct Student {
  let name: String
  let favoriteTeacherID: Int
}

struct Teacher {
  let name: String
  let id: Int
  let email: String?
  let hairColor: String?
}

struct School {
  let name: String
  let teachers: [Teacher]

  func getTeacher(withID id: Int) ->Teacher? {
    for teacher in teachers {
      if teacher.id == id {
        return teacher
      }
    }
    return nil
  }

  func printFavoriteTeacherInfo(for student: Student) -> Void  {
    guard let teacher = getTeacher(withID: student.favoriteTeacherID) else {
      print("No teacher with the id \(student.favoriteTeacherID) works at \(name)!")
      return
    }
      print("name: \(teacher.name), hair color: \(teacher.hairColor ?? "no hair color stored in db"), email: \(teacher.email ?? "no email stored in db")")
  }
}

let teachers = [
  Teacher(name: "Lehi", id: 1, email: "lehi@gmail.com", hairColor: nil),
  Teacher(name: "Alex", id: 2, email: "alex@gmail.com", hairColor: "black"),
  Teacher(name: "Alcantara", id: 3, email: "alcantara@gmail.com", hairColor: "brown")
]
let student1 = Student(name: "John", favoriteTeacherID: 1)
let student2 = Student(name: "Mary", favoriteTeacherID: 5)
let uvu = School(name: "UVU", teachers: teachers)

uvu.printFavoriteTeacherInfo(for: student1)
uvu.printFavoriteTeacherInfo(for: student2)