package com.covidtracker.service.impl;

import com.covidtracker.convert.RoleConvert;
import com.covidtracker.dto.RoleDTO;
import com.covidtracker.entity.RoleEntity;
import com.covidtracker.repository.RoleRepository;
import com.covidtracker.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleService implements IRoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private RoleConvert roleConvert;

    @Override
    public List<RoleDTO> findAll() {
        List<RoleDTO> roles = new ArrayList<>();
        List<RoleEntity> entities = roleRepository.findAll();
        for (RoleEntity item : entities){
            RoleDTO roleDTO = roleConvert.convertToDTO(item);
            roles.add(roleDTO);
        }
        return roles;
    }

    @Override
    public RoleDTO findById(long id) { return null; }

    @Override
    @Transactional
    public RoleDTO save(RoleDTO dto) { return null; }

    @Override
    @Transactional
    public void delete(long[] ids) { }
}
