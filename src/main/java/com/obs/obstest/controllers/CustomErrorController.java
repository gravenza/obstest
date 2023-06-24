package com.obs.obstest.controllers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError() {
        // Logic to handle and display the error page
        return "error"; // Return the name of your custom error page
    }

    //@Override
    public String getErrorPath() {
        return "/error";
    }
}

