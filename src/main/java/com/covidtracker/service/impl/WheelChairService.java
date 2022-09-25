package com.covidtracker.service.impl;

import com.covidtracker.convert.WheelChairConverter;
import com.covidtracker.dto.CharityDTO;
import com.covidtracker.dto.WheelChairDTO;
import com.covidtracker.entity.CharityEntity;
import com.covidtracker.entity.WheelChairEntity;
import com.covidtracker.repository.WheelChairRepository;
import com.covidtracker.service.IWheelChairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class WheelChairService implements IWheelChairService {
    @Autowired
    WheelChairRepository wheelChairRepository;

    @Autowired
    WheelChairConverter wheelChairConverter;

    @Override
    public List<WheelChairDTO> findAll() {
        List<WheelChairDTO> wheelChaires = new ArrayList<>();
        List<WheelChairEntity> entities = wheelChairRepository.findAll();
        for (WheelChairEntity item : entities){
            WheelChairDTO wheelChairDTO = wheelChairConverter.convertToDTO(item);
            wheelChaires.add(wheelChairDTO);
        }
        return wheelChaires;
    }

    @Override
    public WheelChairDTO findById(long id) {
        WheelChairEntity wheelChairEntity = wheelChairRepository.findOne(id);
        return wheelChairConverter.convertToDTO(wheelChairEntity);
    }

    @Override
    @Transactional
    public WheelChairDTO save(WheelChairDTO dto) {
        WheelChairEntity wheelChairEntity = new WheelChairEntity();
        if (dto.getId() != null) {
            WheelChairEntity oldWheelChair = wheelChairRepository.findOne(dto.getId());
            wheelChairEntity = wheelChairConverter.DtoToEntity(oldWheelChair, dto);
        } else {
            wheelChairEntity = wheelChairConverter.convertToEntity(dto);
        }
        return wheelChairConverter.convertToDTO(wheelChairRepository.save(wheelChairEntity));
    }

    @Override
    public void delete(long[] ids) {
        for (long id: ids) {
            wheelChairRepository.delete(id);
        }
    }

    @Override
    public List<WheelChairDTO> findAllByStatus(int status) {
        List<WheelChairDTO> wheelChairDTOS = new ArrayList<>();
        List<WheelChairEntity> entities = (wheelChairRepository.findAllByStatus(status));
        for (WheelChairEntity item : entities){
            WheelChairDTO wheelChairDTO = wheelChairConverter.convertToDTO(item);
            wheelChairDTOS.add(wheelChairDTO);
        }
        return wheelChairDTOS;
    }
}
