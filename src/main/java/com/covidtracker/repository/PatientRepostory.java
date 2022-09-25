package com.covidtracker.repository;

import com.covidtracker.entity.PatientEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepostory extends JpaRepository<PatientEntity, Long> {
}
