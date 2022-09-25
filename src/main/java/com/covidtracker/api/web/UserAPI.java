package com.covidtracker.api.web;

import com.covidtracker.controller.admin.UserController;
import com.covidtracker.dto.UserDTO;
import com.covidtracker.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "userAPIOfWeb")
public class UserAPI {

    @Autowired
    private IUserService userService;

    @PutMapping("/api/web/user")
    public UserDTO updateUser(@RequestBody UserDTO userDTO) {
        UserController.userDTO.setListDTO(null);
        return userService.save(userDTO);
    }
}