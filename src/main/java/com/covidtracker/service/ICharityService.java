package com.covidtracker.service;

import com.covidtracker.dto.CharityDTO;

import java.util.List;

public interface ICharityService {
    List<CharityDTO> findAll();
    CharityDTO findById(long id);
    CharityDTO save(CharityDTO dto);
    void delete(long[] ids);
    List<CharityDTO> findAllByCreateBy(String name);
}
