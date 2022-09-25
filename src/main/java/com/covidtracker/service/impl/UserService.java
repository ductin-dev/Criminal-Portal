package com.covidtracker.service.impl;

import com.covidtracker.convert.UserConvert;
import com.covidtracker.dto.UserDTO;
import com.covidtracker.entity.RoleEntity;
import com.covidtracker.entity.UserEntity;
import com.covidtracker.repository.RoleRepository;
import com.covidtracker.repository.UserRepository;
import com.covidtracker.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserConvert userConvert;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public List<UserDTO> findAll() {
        List<UserDTO> users = new ArrayList<>();
        List<UserEntity> entities = userRepository.findAll();
        for (UserEntity item : entities){
            UserDTO areaDTO = userConvert.convertToDTO(item);
            users.add(areaDTO);
        }
        return users;
    }

    @Override
    public UserDTO findById(long id) {
        UserEntity userEntity = userRepository.findOne(id);
        return userConvert.convertToDTO(userEntity);
    }

    @Override
    @Transactional
    public UserDTO save(UserDTO dto) {
        UserEntity oldUserEntity =  userRepository.findOne(dto.getId());
        dto.setCreatedBy(oldUserEntity.getCreatedBy());
        dto.setAvatar(oldUserEntity.getAvatar());
//        dto.setFullname(oldUserEntity.getFullname());
        dto.setPassword(oldUserEntity.getPassword());
        dto.setStatus(oldUserEntity.getStatus());
        dto.setUserName(oldUserEntity.getUserName());
        oldUserEntity.getRolez().clear();
//        oldUserEntity.getRolez().remove(roleRepository.findOneByCode("USER"));
        RoleEntity roleEntity = roleRepository.findOneByCode("MOD");;
        oldUserEntity.getRolez().add(roleEntity);
        System.out.println(oldUserEntity);
        oldUserEntity = userConvert.DtoToEntity(oldUserEntity, dto);
        return userConvert.convertToDTO(userRepository.save(oldUserEntity));
    }

    @Override
    public UserDTO findByUserName(String username) {
        UserEntity userEntity = userRepository.findOneByUserName(username);
        return userConvert.convertToDTO(userEntity);
    }

}
