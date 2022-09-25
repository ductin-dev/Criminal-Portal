package com.covidtracker.api.web;

import com.covidtracker.controller.admin.UserController;
import com.covidtracker.dto.UserDTO;
import com.covidtracker.service.IRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController(value = "registerAPIOfWeb")
public class RegisterAccount {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private IRegisterService registerService;

    @PostMapping("/api/register")
    public UserDTO createUser(@RequestBody UserDTO userDTO) {
        userDTO.setStatus(1);
        UserController.userDTO.setListDTO(null);
        userDTO.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        return registerService.save(userDTO);
    }
}
