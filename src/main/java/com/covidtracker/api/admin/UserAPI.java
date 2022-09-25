package com.covidtracker.api.admin;

import com.covidtracker.controller.admin.UserController;
import com.covidtracker.dto.UserDTO;
import com.covidtracker.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "userAPIOfAdmin")
public class UserAPI {
    @Autowired
    private IUserService userService;

    @PostMapping("/api/user")
    public UserDTO createUser(@RequestBody UserDTO areaDTO) {
        UserController.userDTO.setListDTO(null);
        return userService.save(areaDTO);
    }

    @PutMapping("/api/user")
    public UserDTO updateUser(@RequestBody UserDTO updateArea) {
        UserController.userDTO.setListDTO(null);
        return userService.save(updateArea);
    }
}
