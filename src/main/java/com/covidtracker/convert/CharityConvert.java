package com.covidtracker.convert;

import com.covidtracker.dto.CharityDTO;
import com.covidtracker.entity.CharityEntity;
import org.springframework.stereotype.Component;

@Component
public class CharityConvert {

    public CharityDTO convertToDTO(CharityEntity entity) {
        CharityDTO result = new CharityDTO();
        result.setId(entity.getId());
        result.setcX(entity.getcX());
        result.setcY(entity.getcY());
        result.setName(entity.getName());
        result.setAddress(entity.getAddress());
        result.setContent(entity.getContent());
        result.setCreatedBy(entity.getCreatedBy());
        result.setModifiedBy(entity.getModifiedBy());
        return result;
    }

    public CharityEntity convertToEntity(CharityDTO dto) {
        CharityEntity result = new CharityEntity();
        result.setId(dto.getId());
        result.setcX(dto.getcX());
        result.setcY(dto.getcY());
        result.setName(dto.getName());
        result.setAddress(dto.getAddress());
        result.setContent(dto.getContent());
        result.setCreatedBy(dto.getCreatedBy());
        result.setModifiedBy(dto.getModifiedBy());
        return result;
    }

    public CharityEntity DtoToEntity(CharityEntity entity, CharityDTO dto) {
        entity.setId(dto.getId());
        entity.setcX(dto.getcX());
        entity.setcY(dto.getcY());
        entity.setName(dto.getName());
        entity.setAddress(dto.getAddress());
        entity.setContent(dto.getContent());
        entity.setCreatedBy(dto.getCreatedBy());
        entity.setModifiedBy(dto.getModifiedBy());
        return entity;
    }

}
