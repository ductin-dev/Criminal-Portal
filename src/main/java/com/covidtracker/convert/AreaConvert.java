package com.covidtracker.convert;

import com.covidtracker.dto.AreaDTO;
import com.covidtracker.entity.AreaEntity;
import org.springframework.stereotype.Component;

@Component
public class AreaConvert {

    public AreaDTO convertToDTO(AreaEntity entity) {
        AreaDTO result = new AreaDTO();
        result.setId(entity.getId());
        result.setaX(entity.getaX());
        result.setaY(entity.getaY());
        result.setAddress(entity.getAddress());
        result.setDetail(entity.getDetail());
        result.setCreatedBy(entity.getCreatedBy());
        result.setModifiedBy(entity.getModifiedBy());
        return result;
    }

    public AreaEntity convertToEntity(AreaDTO dto) {
        AreaEntity result = new AreaEntity();
        result.setId(dto.getId());
        result.setaX(dto.getaX());
        result.setaY(dto.getaY());
        result.setAddress(dto.getAddress());
        result.setDetail(dto.getDetail());
        result.setCreatedBy(dto.getCreatedBy());
        result.setModifiedBy(dto.getModifiedBy());
        return result;
    }

    public AreaEntity DtoToEntity(AreaEntity entity, AreaDTO dto) {
        entity.setId(dto.getId());
        entity.setaX(dto.getaX());
        entity.setaY(dto.getaY());
        entity.setAddress(dto.getAddress());
        entity.setDetail(dto.getDetail());
        entity.setCreatedBy(dto.getCreatedBy());
        entity.setModifiedBy(dto.getModifiedBy());
        return entity;
    }

}
