package com.covidtracker.service.impl;

import com.covidtracker.convert.AreaConvert;
import com.covidtracker.dto.AreaDTO;
import com.covidtracker.entity.AreaEntity;
import com.covidtracker.repository.AreaRepository;
import com.covidtracker.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class AreaService implements IAreaService {

    @Autowired
    private AreaRepository areaRepository;

    @Autowired
    private AreaConvert areaConvert;

    @Override
    public List<AreaDTO> findAll() {
        List<AreaDTO> areas = new ArrayList<>();
        List<AreaEntity> entities = areaRepository.findAll();
        for (AreaEntity item : entities){
        AreaDTO areaDTO = areaConvert.convertToDTO(item);
            areas.add(areaDTO);
        }
        return areas;
    }

    @Override
    public AreaDTO findById(long id) {
        AreaEntity areaEntity = areaRepository.findOne(id);
        return areaConvert.convertToDTO(areaEntity);
    }


    @Override
    @Transactional
    public AreaDTO save(AreaDTO dto) {

        AreaEntity areaEntity = new AreaEntity();

        if (dto.getId() != null) {
            AreaEntity oldArea = areaRepository.findOne(dto.getId());
            dto.setCreatedBy(oldArea.getCreatedBy());
            areaEntity = areaConvert.DtoToEntity(oldArea, dto);
        } else {
            areaEntity = areaConvert.convertToEntity(dto);
        }
        return areaConvert.convertToDTO(areaRepository.save(areaEntity));
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id: ids) {
            areaRepository.delete(id);
        }
    }

}
