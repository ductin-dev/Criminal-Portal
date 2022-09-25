package com.covidtracker.service;

import com.covidtracker.dto.AreaDTO;

import java.util.List;

public interface IAreaService {
    List<AreaDTO> findAll();
    AreaDTO findById(long id);
    AreaDTO save(AreaDTO dto);
    void delete(long[] ids);
}
