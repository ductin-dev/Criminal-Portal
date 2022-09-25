package com.covidtracker.convert;

import com.covidtracker.dto.WheelChairDTO;
import com.covidtracker.entity.WheelChairEntity;
import org.springframework.stereotype.Component;

@Component
public class WheelChairConverter {
    public WheelChairDTO convertToDTO(WheelChairEntity entity) {
        WheelChairDTO result = new WheelChairDTO();
        result.setId(entity.getId());
        result.setName(entity.getName());
        result.setPhone(entity.getPhone());
        result.setAddress(entity.getAddress());
        result.setDetail(entity.getDetail());
        result.setStatus(entity.getStatus());
        result.setBase64(entity.getBase64());
        return result;
    }

    public WheelChairEntity convertToEntity(WheelChairDTO dto) {
        WheelChairEntity result = new WheelChairEntity();
        result.setId(dto.getId());
        result.setName(dto.getName());
        result.setPhone(dto.getPhone());
        result.setAddress(dto.getAddress());
        result.setDetail(dto.getDetail());
        result.setStatus(dto.getStatus());
        result.setBase64(dto.getBase64());
        return result;
    }

    public WheelChairEntity DtoToEntity(WheelChairEntity entity, WheelChairDTO dto) {
        entity.setId(dto.getId());
        entity.setName(dto.getName());
        entity.setPhone(dto.getPhone());
        entity.setAddress(dto.getAddress());
        entity.setDetail(dto.getDetail());
        entity.setStatus(dto.getStatus());
        entity.setBase64(dto.getBase64());
        return entity;
    }
}
