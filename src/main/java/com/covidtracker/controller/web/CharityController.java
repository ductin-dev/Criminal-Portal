package com.covidtracker.controller.web;

import com.covidtracker.dto.CharityDTO;
import com.covidtracker.service.ICharityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "charityControllerOfWeb")
public class CharityController {

    @Autowired
    private ICharityService charityService;

    public static CharityDTO charityDTO=new CharityDTO();

    @RequestMapping(value = "/web/charity/list", method = RequestMethod.GET)
    public ModelAndView showList() {
        ModelAndView mav = new ModelAndView("web/charity/list");
        if (charityDTO.getListDTO()==null||charityDTO.getListDTO().isEmpty()) {
            charityDTO.setListDTO(charityService.findAll());
        }
        mav.addObject("CHARITY_DTO", charityDTO);
        return mav;
    }

}
