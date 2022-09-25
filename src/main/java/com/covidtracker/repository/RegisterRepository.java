package com.covidtracker.repository;

import com.covidtracker.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisterRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findOneByUserName(String username);
    UserEntity findOneByEmail(String email);
}
