import Foundation

class Teacher {
    private var id: Int
    private var firstName: String
    private var lastName: String
    private var subjectsTaught: [Subject]
    private var studentsTaught: [Student]
    
    var teacherName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(id: Int, firstName: String, lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.subjectsTaught = []
        self.studentsTaught = []
    }
    
    // Метод для добавления предмета, который ведет учитель
    func addSubject(_ subject: Subject) {
        subjectsTaught.append(subject)
    }
    
    func addStudent(_ student: Student) {
        studentsTaught.append(student)
    }
    
    // Метод для установки оценки ученику по определенному предмету
    func studentGrading(subject: Subject, student: Student) {
        subjectsTaught.append(subject)
        student.addSubject(subject)
        
        if let index = studentsTaught.firstIndex(where: { $0.studentId == student.studentId }) {
            studentsTaught[index] = student
        } else {
            studentsTaught.append(student)
        }
    }
    
     //Метод для получения информации об учителе и предметах, которые он ведет
    func teacherInfo(studentId: Int) -> (id: Int, name: String, lastName: String, subject: String?, student: String, grade: String?)? {
        guard let student = studentsTaught.first(where: { $0.studentId == studentId }) else { return nil }
        
        return (id: id, name: firstName, lastName: lastName, subject: subjectsTaught.last?.subjectName, student: student.studentName, grade: subjectsTaught.last?.grade)
    }
}
