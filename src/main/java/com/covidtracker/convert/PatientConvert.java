package com.covidtracker.convert;

import com.covidtracker.dto.PatientDTO;
import com.covidtracker.entity.PatientEntity;
import org.springframework.stereotype.Component;

@Component
public class PatientConvert {

    public PatientDTO convertToDTO(PatientEntity entity) {
        PatientDTO result = new PatientDTO();
        result.setId(entity.getId());
        result.setBnX(entity.getBnX());
        result.setBnY(entity.getBnY());
        result.setCode(entity.getCode());
        result.setName(entity.getName());
        result.setAddress(entity.getAddress());
        result.setStatus(entity.getStatus());
        result.setCreatedBy(entity.getCreatedBy());
        result.setModifiedBy(entity.getModifiedBy());
        return result;
    }

    public PatientEntity convertToEntity(PatientDTO dto) {
        PatientEntity result = new PatientEntity();
        result.setId(dto.getId());
        result.setBnX(dto.getBnX());
        result.setBnY(dto.getBnY());
        result.setCode(dto.getCode());
        result.setName(dto.getName());
        result.setAddress(dto.getAddress());
        result.setStatus(dto.getStatus());
        result.setCreatedBy(dto.getCreatedBy());
        result.setModifiedBy(dto.getModifiedBy());
        return result;
    }

    public PatientEntity DtoToEntity(PatientEntity entity, PatientDTO dto) {
        entity.setId(dto.getId());
        entity.setBnX(dto.getBnX());
        entity.setBnY(dto.getBnY());
        entity.setCode(dto.getCode());
        entity.setName(dto.getName());
        entity.setAddress(dto.getAddress());
        entity.setStatus(dto.getStatus());
        entity.setCreatedBy(dto.getCreatedBy());
        entity.setModifiedBy(dto.getModifiedBy());
        return entity;
    }

}
