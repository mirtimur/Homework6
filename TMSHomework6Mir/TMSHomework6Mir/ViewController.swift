import UIKit

class ViewController: UIViewController {
    
    let student = Student(id: 0, name: "Biba", lastName: "Boba", age: 18)
    let teacher = Teacher(id: 1, firstName: "Mikle", lastName: "Miklovich")

    override func viewDidLoad() {
        super.viewDidLoad()
      
        addSubject(.init(subjectName: "Math", grade: "4"))
        addTeacher(teacher)
        print(student.studentInfo(subject: "Math"))
        teacher.studentGrading(subject: .init(subjectName: "Biology", grade: "6") , student: student)
        print(student.studentInfo(subject: "Biology"))
        print(teacher.teacherInfo(studentId: student.studentId))
    }
    
    private func addSubject(_ subject: Subject) {
        student.addSubject(subject)
        teacher.addSubject(subject)
    }
    
    private func addTeacher(_ teacher: Teacher) {
        student.addTeacherToStudent(teacher)
        teacher.addStudent(student)
    }
}
