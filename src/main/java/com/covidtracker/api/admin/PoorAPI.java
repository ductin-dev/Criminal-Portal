package com.covidtracker.api.admin;

import com.covidtracker.controller.admin.PoorController;
import com.covidtracker.controller.web.MapHandle;
import com.covidtracker.dto.WheelChairDTO;
import com.covidtracker.service.IWheelChairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "poorAPIOfAdmin")
public class PoorAPI {

    @Autowired
    private IWheelChairService wheelChairService;

    @PostMapping("/api/poor")
    public WheelChairDTO createPoor(@RequestBody WheelChairDTO wheelChairDTO) {
        MapHandle.areaList=null;
        PoorController.wheelChairDTO.setListDTO(null);
        return wheelChairService.save(wheelChairDTO);
    }

    @PutMapping("/api/poor")
    public WheelChairDTO updatePoor(@RequestBody WheelChairDTO wheelChairDTO)
    {
        MapHandle.areaList=null;
        PoorController.wheelChairDTO.setListDTO(null);
        wheelChairDTO.setStatus(1);
        return wheelChairService.save(wheelChairDTO);
    }

    @DeleteMapping("/api/poor")
    public void deletePoor(@RequestBody long[] ids) {
        MapHandle.areaList=null;
        PoorController.wheelChairDTO.setListDTO(null);
        wheelChairService.delete(ids);
    }
}
