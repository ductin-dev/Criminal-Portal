package com.covidtracker.service.impl;

import com.covidtracker.convert.CharityConvert;
import com.covidtracker.dto.CharityDTO;
import com.covidtracker.entity.CharityEntity;
import com.covidtracker.repository.CharityRepository;
import com.covidtracker.service.ICharityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class CharityService implements ICharityService {

    @Autowired
    private CharityRepository charityRepository;

    @Autowired
    private CharityConvert charityConvert;

    @Override
    public List<CharityDTO> findAll() {

        List<CharityDTO> charities = new ArrayList<>();
        List<CharityEntity> entities = charityRepository.findAll();
        for (CharityEntity item : entities){
            CharityDTO charityDTO = charityConvert.convertToDTO(item);
            charities.add(charityDTO);
        }
        return charities;
    }

    @Override
    public CharityDTO findById(long id) {
        CharityEntity charityEntity = charityRepository.findOne(id);
        return charityConvert.convertToDTO(charityEntity);
    }

    @Override
    @Transactional
    public CharityDTO save(CharityDTO dto) {
        CharityEntity charityEntity = new CharityEntity();
        if (dto.getId() != null) {
            CharityEntity oldCharity = charityRepository.findOne(dto.getId());
            dto.setCreatedBy(oldCharity.getCreatedBy());
            charityEntity = charityConvert.DtoToEntity(oldCharity, dto);
        } else {
            charityEntity = charityConvert.convertToEntity(dto);
        }
        return charityConvert.convertToDTO(charityRepository.save(charityEntity));
    }

    @Override
    @Transactional
    public void delete(long[] ids) {
        for (long id: ids) {
            charityRepository.delete(id);
        }
    }

    @Override
    public List<CharityDTO> findAllByCreateBy(String name) {
        List<CharityDTO> charities = new ArrayList<>();
        List<CharityEntity> entities = (charityRepository.findAllByCreatedBy(name));
        for (CharityEntity item : entities){
            CharityDTO charityDTO = charityConvert.convertToDTO(item);
            charities.add(charityDTO);
        }
        return charities;
    }
}
