import Foundation

class Student {
    private var id: Int
    private var name: String
    private var lastName: String
    private var age: Int
    private var subjects: [Subject]
    private var teacher:  Teacher?
    
    var studentId: Int {
        return id
    }
    
    var studentName: String {
        return "\(name) \(lastName)"
    }
    
    init(id: Int, name: String, lastName: String, age: Int) {
        self.id = id
        self.name = name
        self.lastName = lastName
        self.age = age
        self.subjects = []
    }
    
    func addSubject(_ subject: Subject) {
        subjects.append(subject)
    }
    
    func addAge(_ updatedAge: Int) {
        age = updatedAge
    }
    
    func studentName(_ updatedName: String) {
        name = updatedName
    }

    func addTeacherToStudent(_ newTeacher: Teacher) {
        teacher = newTeacher
    }
    
    // Метод для получения информации о студенте и его предметах
    func studentInfo(subject: String) -> (id: Int, name: String, lastName: String, age: Int, subjectName: String, grade: String, teacher: String)? {
        guard let subject = subjects.first(where: { $0.subjectName == subject }),
              let teacher = teacher?.teacherName else { return nil }
        
        return (id: id, name: name, lastName: lastName, age: age, subjectName: subject.subjectName, grade: subject.grade, teacher: teacher)
    }
}
