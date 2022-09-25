package com.covidtracker.service.impl;

import com.covidtracker.dto.MyUser;
import com.covidtracker.entity.RoleEntity;
import com.covidtracker.entity.UserEntity;
import com.covidtracker.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		UserEntity userEntity = userRepository.findOneByUserNameAndStatus(username, 1);

		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (RoleEntity role: userEntity.getRolez()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(),
							true, true, true, true, authorities);

		myUser.setId(userEntity.getId());
		myUser.setFullname(userEntity.getFullname());
		myUser.setEmail(userEntity.getEmail());
		myUser.setPhone(userEntity.getPhone());
		myUser.setAddress(userEntity.getAddress());
		myUser.setAvatar(userEntity.getAvatar());
		return myUser;
	}

}
