package com.covidtracker.service.impl;

import com.covidtracker.convert.PatientConvert;
import com.covidtracker.dto.PatientDTO;
import com.covidtracker.entity.PatientEntity;
import com.covidtracker.repository.PatientRepostory;
import com.covidtracker.service.IPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class PatientService implements IPatientService {

    @Autowired
    private PatientRepostory patientRepostory;

    @Autowired
    private PatientConvert patientConvert;

    @Override
    public List<PatientDTO> findAll() {
        List<PatientDTO> patients = new ArrayList<>();
        List<PatientEntity> entities = patientRepostory.findAll();
        for (PatientEntity item : entities){
            PatientDTO patientDTO = patientConvert.convertToDTO(item);
            patients.add(patientDTO);
        }
        return patients;
    }

    @Override
    public PatientDTO findById(long id) {
        PatientEntity patientEntity = patientRepostory.findOne(id);
        return patientConvert.convertToDTO(patientEntity);
    }

    @Override
    @Transactional
    public PatientDTO save(PatientDTO dto) {
        PatientEntity patientEntity = new PatientEntity();
        if (dto.getId() != null) {
            PatientEntity oldPatient = patientRepostory.findOne(dto.getId());
            dto.setCreatedBy(oldPatient.getCreatedBy());
            patientEntity = patientConvert.DtoToEntity(oldPatient, dto);
        } else {
            patientEntity = patientConvert.convertToEntity(dto);
        }
        return patientConvert.convertToDTO(patientRepostory.save(patientEntity));
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id: ids) {
            patientRepostory.delete(id);
        }
    }
}
