package com.covidtracker.service;

import com.covidtracker.dto.UserDTO;

import java.util.List;

public interface IUserService {
    List<UserDTO> findAll();
    UserDTO findById(long id);
    UserDTO save(UserDTO dto);
    UserDTO findByUserName(String username);
}
