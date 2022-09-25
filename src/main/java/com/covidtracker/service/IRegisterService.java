package com.covidtracker.service;

import com.covidtracker.dto.UserDTO;

public interface IRegisterService {
    UserDTO findByUserName(String userName);
    UserDTO findByEmail(String email);
    UserDTO save(UserDTO dto);
}
