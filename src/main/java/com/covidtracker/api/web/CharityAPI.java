package com.covidtracker.api.web;

import com.covidtracker.controller.web.CharityController;
import com.covidtracker.controller.web.MapHandle;
import com.covidtracker.dto.CharityDTO;
import com.covidtracker.service.ICharityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController(value = "charityAPIOfWeb")
public class CharityAPI {

    @Autowired
    private ICharityService charityService;

    @PostMapping("/api/web/charity")
    public CharityDTO createCharity(HttpServletRequest request,@RequestBody CharityDTO charityDTO) {
        MapHandle.charityList=null;
        CharityController.charityDTO.setListDTO(null);
        request.getSession().setAttribute("CHARITY_CUSTOM",null);
        return charityService.save(charityDTO);
    }

    @PutMapping("/api/web/charity")
    public CharityDTO updateCharity(HttpServletRequest request, @RequestBody CharityDTO updateCharity) {
        MapHandle.charityList=null;
        CharityController.charityDTO.setListDTO(null);
        request.getSession().setAttribute("CHARITY_CUSTOM",null);
        return charityService.save(updateCharity);
    }

    @DeleteMapping("/api/web/charity")
    public void deleteCharity(HttpServletRequest request,@RequestBody long[] ids) {
        MapHandle.charityList=null;
        CharityController.charityDTO.setListDTO(null);
        request.getSession().setAttribute("CHARITY_CUSTOM",null);
        charityService.delete(ids);
    }
}
