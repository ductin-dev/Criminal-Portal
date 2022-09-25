package com.covidtracker.api.admin;

import com.covidtracker.controller.web.CharityController;
import com.covidtracker.controller.web.MapHandle;
import com.covidtracker.dto.CharityDTO;
import com.covidtracker.service.ICharityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController(value = "charityAPIOfAdmin")
public class CharityAPI {

    @Autowired
    private ICharityService charityService;

    @PostMapping("/api/charity")
    public CharityDTO createCharity(HttpServletRequest request ,@RequestBody CharityDTO charityDTO) {
        MapHandle.charityList=null;
        CharityController.charityDTO.setListDTO(null);
        com.covidtracker.controller.admin.CharityController.charityDTO.setListDTO(null);
        request.getSession().setAttribute("CHARITY_CUSTOM",null);
        return charityService.save(charityDTO);
    }

    @PutMapping("/api/charity")
    public CharityDTO updateCharity(HttpServletRequest request ,@RequestBody CharityDTO updateCharity) {
        MapHandle.charityList=null;
        CharityController.charityDTO.setListDTO(null);
        com.covidtracker.controller.admin.CharityController.charityDTO.setListDTO(null);
        request.getSession().setAttribute("CHARITY_CUSTOM",null);
        return charityService.save(updateCharity);
    }

    @DeleteMapping("/api/charity")
    public void deleteCharity(HttpServletRequest request ,@RequestBody long[] ids) {
        MapHandle.charityList=null;
        CharityController.charityDTO.setListDTO(null);
        com.covidtracker.controller.admin.CharityController.charityDTO.setListDTO(null);
        request.getSession().setAttribute("CHARITY_CUSTOM",null);
        charityService.delete(ids);
    }
}
