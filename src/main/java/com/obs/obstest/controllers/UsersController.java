package com.obs.obstest.controllers;

import com.obs.obstest.models.Users;
import jakarta.servlet.http.HttpSession;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RestController
public class UsersController {
    private List<Users> users;

    public UsersController() {
        users = new ArrayList<>();

        users.add(new Users("Administrator", "Administrator", "Password!@#"));
        users.add(new Users("Administrator2", "Admin1234", "Password!"));
        users.add(new Users("Administrator3", "Admin5678", "P@ssword"));
    }

    @PostMapping("/doLogin")
    public String doLogin(@RequestBody Users loginData, HttpSession session) throws Exception {

            String username = loginData.getUsername();
            String password = loginData.getPassword();

            JSONObject response = new JSONObject();

        try {
            boolean matchFound = false;

            for (Users user : users) {
                if (user.getUsername().equalsIgnoreCase(username) && user.getPassword().equalsIgnoreCase(password)) {
                    matchFound = true;
                    break;
                }
            }

            if (matchFound) {
                session.setAttribute("userid", username);
                response.put("status", "Success");
                response.put("message", "Login Success");
            } else {
                response.put("status", "Failed");
                response.put("message", "Login Failed, username or password does not match");
            }

        }catch (Exception e){
            response.put("status", "Failed");
            response.put("message", e.getMessage());
        }

        // No match found, return an error message
        return response.toString();
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session){
        session.invalidate();
        return new ModelAndView("redirect:/");
    }

}
