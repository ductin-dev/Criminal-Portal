package com.covidtracker.api.admin;

import com.covidtracker.controller.admin.AreaController;
import com.covidtracker.controller.web.MapHandle;
import com.covidtracker.dto.AreaDTO;
import com.covidtracker.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "areaAPIOfAdmin")
public class AreaAPI {
    @Autowired
    private IAreaService areaService;

    @PostMapping("/api/area")
    public AreaDTO createArea(@RequestBody AreaDTO areaDTO) {
        MapHandle.areaList=null;
        AreaController.areaDTO.setListDTO(null);
        return areaService.save(areaDTO);
    }

    @PutMapping("/api/area")
    public AreaDTO updateArea(@RequestBody AreaDTO updateArea)
    {
        MapHandle.areaList=null;
        AreaController.areaDTO.setListDTO(null);
        return areaService.save(updateArea);
    }

    @DeleteMapping("/api/area")
    public void deleteArea(@RequestBody long[] ids) {
        MapHandle.areaList=null;
        AreaController.areaDTO.setListDTO(null);
        areaService.delete(ids);
    }
}
