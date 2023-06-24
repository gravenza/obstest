package com.obs.obstest.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @GetMapping("/")
    public ModelAndView home(jakarta.servlet.http.HttpSession session) {

        if (session.getAttribute("userid") != null){
            return new ModelAndView("redirect:/dataStudent");
        }

        return new ModelAndView("index");
    }
}

