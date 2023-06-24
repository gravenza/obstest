package com.obs.obstest.models;

public class Student {
    private String studentId;
    private String studentName;
    private String department;
    private int marks;

    public Student(String studentId, String studentName, String department, int marks) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.department = department;
        this.marks = marks;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }
}
