package com.covidtracker.convert;

import com.covidtracker.dto.RoleDTO;
import com.covidtracker.dto.UserDTO;
import com.covidtracker.entity.RoleEntity;
import com.covidtracker.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class UserConvert {

    @Autowired
    private RoleConvert roleConvert;

    public UserDTO convertToDTO(UserEntity entity) {
        List<RoleEntity> roleEntityList = entity.getRolez();

        List<RoleDTO> roleDTOList  = roleEntityList.stream()
                .map(r -> roleConvert.convertToDTO(r))
                .collect(Collectors.toList());

        UserDTO result = new UserDTO();
        result.setId(entity.getId());
        result.setUserName(entity.getUserName());
        result.setPassword(entity.getPassword());
        result.setFullname(entity.getFullname());
        result.setEmail(entity.getEmail());
        result.setAvatar(entity.getAvatar());
        result.setPhone(entity.getPhone());
        result.setAddress(entity.getAddress());
        result.setStatus(entity.getStatus());
        result.setRoleDTO(roleDTOList);

//        String roles = "";
//        for ( RoleEntity roleEntity: entity.getRolez()) {
//            roles += roleEntity.getCode() + ",";
//
//        }

        result.setNameRole(entity.getRolez().stream().map(RoleEntity::getName).collect(Collectors.joining(",")));
        result.setRoles(entity.getRolez().stream().map(RoleEntity::getCode).collect(Collectors.joining(",")));

        return result;
    }

    public UserEntity convertToEntity(UserDTO dto) {
        UserEntity result = new UserEntity();
        result.setId(dto.getId());
        result.setUserName(dto.getUserName());
        result.setPassword(dto.getPassword());
        result.setFullname(dto.getFullname());
        result.setEmail(dto.getEmail());
        result.setAvatar(dto.getAvatar());
        result.setPhone(dto.getPhone());
        result.setAddress(dto.getAddress());
        result.setStatus(dto.getStatus());
//        result.setRoleCode(dto.getRolez().get(0).getCode());
        return result;
    }

    public UserEntity DtoToEntity(UserEntity entity, UserDTO dto) {
        entity.setId(dto.getId());
        entity.setUserName(dto.getUserName());
        entity.setPassword(dto.getPassword());
        entity.setFullname(dto.getFullname());
        entity.setEmail(dto.getEmail());
        entity.setAvatar(dto.getAvatar());
        entity.setPhone(dto.getPhone());
        entity.setAddress(dto.getAddress());
        entity.setStatus(dto.getStatus());
//        entity.setRolez(dto.getRoleCode());
        return entity;
    }

}
