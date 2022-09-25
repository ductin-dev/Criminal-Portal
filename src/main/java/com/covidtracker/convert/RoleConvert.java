package com.covidtracker.convert;

import com.covidtracker.dto.RoleDTO;
import com.covidtracker.entity.RoleEntity;
import org.springframework.stereotype.Component;

@Component
public class RoleConvert {

    public RoleDTO convertToDTO(RoleEntity entity) {
        RoleDTO result = new RoleDTO();
        result.setId(entity.getId());
        result.setName(entity.getName());
        result.setCode(entity.getCode());
        return result;
    }

    public RoleEntity convertToEntity(RoleDTO dto) {
        RoleEntity result = new RoleEntity();
        result.setId(dto.getId());
        result.setName(dto.getName());
        result.setCode(dto.getCode());
        return result;
    }

    public RoleEntity DtoToEntity(RoleEntity entity, RoleDTO dto) {
        entity.setId(dto.getId());
        entity.setName(dto.getName());
        entity.setCode(dto.getCode());
        return entity;
    }

}
