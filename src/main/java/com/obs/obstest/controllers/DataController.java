package com.obs.obstest.controllers;

import com.obs.obstest.models.Student;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class DataController {

    private List<Student> students;

    public DataController() {
        // Initialize the list of hardcoded students
        students = new ArrayList<>();

        students.add(new Student("S1", "John Doe", "Dep1", 35));
        students.add(new Student("S2", "Michael", "Dep1", 70));
        students.add(new Student("S3", "Billy Chan", "Dep1", 60));
        students.add(new Student("S4", "Albertino Lee", "Dep1", 90));
        students.add(new Student("S5", "Susanti", "Dep2", 30));
        students.add(new Student("S6", "Upin","Dep3", 32));
        students.add(new Student("S7", "Ipin", "Dep3", 70));
        students.add(new Student("S8", "Tonny Braxton", "Dep3", 20));
    }

    @GetMapping("/dataStudent")
    public ModelAndView getData(ModelMap model, HttpSession session) {
        // Calculate pass percentage for each department
        List<String> departments = new ArrayList<>();

        for (Student student : students) {
            if (!departments.contains(student.getDepartment())) {
                departments.add(student.getDepartment());
            }
        }

        List<Double> passPercentages = new ArrayList<>();
        for (String department : departments) {
            int totalStudents = 0;
            int passedStudents = 0;

            for (Student student : students) {
                if (student.getDepartment().equals(department)) {
                    totalStudents++;
                    if (student.getMarks() >= 40) {
                        passedStudents++;
                    }
                }
            }

            double passPercentage = (double) passedStudents / totalStudents * 100;
            passPercentages.add(passPercentage);
        }

        model.addAttribute("students", students);
        model.addAttribute("departments", departments);
        model.addAttribute("passPercentages", passPercentages);
        model.addAttribute("username", session.getAttribute("userid"));

        return new ModelAndView("data", model);
    }
}

