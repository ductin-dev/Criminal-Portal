package com.covidtracker.service;


import com.covidtracker.dto.WheelChairDTO;

import java.util.List;

public interface IWheelChairService {
    List<WheelChairDTO> findAll();
    WheelChairDTO findById(long id);
    WheelChairDTO save(WheelChairDTO dto);
    void delete(long[] ids);
    List<WheelChairDTO> findAllByStatus(int status);
}
