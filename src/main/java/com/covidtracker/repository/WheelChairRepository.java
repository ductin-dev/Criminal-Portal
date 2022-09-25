package com.covidtracker.repository;

import com.covidtracker.entity.WheelChairEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WheelChairRepository extends JpaRepository<WheelChairEntity, Long> {
    List<WheelChairEntity> findAllByStatus(int status);
}
