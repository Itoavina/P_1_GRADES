package com.grades.controller;

import com.grades.model.GradingSimulationResult;
import com.grades.service.GeneralService;
import com.grades.service.GradingService;
import com.grades.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/simulation")
public class GradingController {

    @Autowired private GradingService gradingService;
    @Autowired private StudentService studentService;
    @Autowired private GeneralService generalService;

    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        model.addAttribute("exams", generalService.getAllExams());
        return "simulation/form";
    }

    @PostMapping("/calculate")
    public String calculate(@RequestParam("idStudent") Integer studentId, 
                            @RequestParam("idExam") Integer examId, 
                            Model model) {
        GradingSimulationResult result = gradingService.simulateGrading(studentId, examId);
        model.addAttribute("result", result);
        // We re-add students and exams in case they want to run another simulation on the same page
        model.addAttribute("students", studentService.getAllStudents());
        model.addAttribute("exams", generalService.getAllExams());
        model.addAttribute("selectedStudent", studentId);
        model.addAttribute("selectedExam", examId);
        return "simulation/result";
    }
}
