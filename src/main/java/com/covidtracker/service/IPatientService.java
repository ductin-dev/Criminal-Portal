package com.covidtracker.service;

import com.covidtracker.dto.PatientDTO;

import java.util.List;

public interface IPatientService {
    List<PatientDTO> findAll();
    PatientDTO findById(long id);
    PatientDTO save(PatientDTO dto);
    void delete(long[] ids);
}
