package com.covidtracker.repository;

import com.covidtracker.entity.CharityEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CharityRepository extends JpaRepository<CharityEntity, Long> {
    List<CharityEntity> findAllByCreatedBy(String name);
}
