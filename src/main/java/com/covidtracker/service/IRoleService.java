package com.covidtracker.service;

import com.covidtracker.dto.RoleDTO;

import java.util.List;

public interface IRoleService {
    List<RoleDTO> findAll();
    RoleDTO findById(long id);
    RoleDTO save(RoleDTO dto);
    void delete(long[] ids);
}
