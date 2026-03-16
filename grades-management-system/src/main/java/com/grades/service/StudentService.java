package com.grades.service;

import com.grades.model.Student;
import com.grades.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public Student getStudentById(Integer id) {
        return studentRepository.findById(id);
    }

    public void saveOrUpdate(Student student) {
        if (student.getId() == null || student.getId() == 0) {
            studentRepository.save(student);
        } else {
            studentRepository.update(student);
        }
    }

    public void deleteStudent(Integer id) {
        studentRepository.deleteById(id);
    }
}
