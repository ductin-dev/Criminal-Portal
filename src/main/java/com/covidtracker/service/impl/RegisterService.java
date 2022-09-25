package com.covidtracker.service.impl;

import com.covidtracker.convert.UserConvert;
import com.covidtracker.dto.UserDTO;
import com.covidtracker.entity.RoleEntity;
import com.covidtracker.entity.UserEntity;
import com.covidtracker.repository.RegisterRepository;
import com.covidtracker.repository.RoleRepository;
import com.covidtracker.service.IRegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RegisterService implements IRegisterService {

    @Autowired
    private RegisterRepository registerRepository;

    @Autowired
    private UserConvert userConvert;

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public UserDTO findByUserName(String userName) {
        UserEntity userEntity = registerRepository.findOneByUserName(userName);
        return userConvert.convertToDTO(userEntity);
    }

    @Override
    public UserDTO findByEmail(String email) {
        return null;
    }

    @Override
    @Transactional
    public UserDTO save(UserDTO dto) {
        UserEntity userEntity = new UserEntity();
        UserEntity check =  registerRepository.findOneByUserName(dto.getUserName());
        if (check != null){
            return null;
        } else {
            userEntity = userConvert.convertToEntity(dto);
            RoleEntity roleEntity = roleRepository.findOneByCode("USER");
            if(roleEntity != null){
                userEntity.getRolez().add(roleEntity);
            }
            return userConvert.convertToDTO(registerRepository.save(userEntity));
        }
    }
}
