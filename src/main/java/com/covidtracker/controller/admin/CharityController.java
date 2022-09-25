package com.covidtracker.controller.admin;

import com.covidtracker.dto.CharityDTO;
import com.covidtracker.service.ICharityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "charityControllerOfAdmin")
public class CharityController {

    @Autowired
    private ICharityService charityService;

    public static CharityDTO charityDTO = new CharityDTO();

    @RequestMapping(value = "/admin/charity/list", method = RequestMethod.GET)
    public ModelAndView showList() {
        ModelAndView mav = new ModelAndView("admin/charity/list");
        if (charityDTO.getListDTO()==null||charityDTO.getListDTO().isEmpty()) {
            charityDTO.setListDTO(charityService.findAll());
        }
        mav.addObject("CHARITY_DTO", charityDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/charity/edit", method = RequestMethod.GET)
    public ModelAndView editCharity(@RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("admin/charity/edit");
        if (id != null) {
            charityDTO = charityService.findById(id);
        }
        mav.addObject("CHARITY_DTO", charityDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/charity/new", method = RequestMethod.GET)
    public ModelAndView newCharity() {
        ModelAndView mav = new ModelAndView("admin/charity/new");
        mav.addObject("CHARITY_DTO", charityDTO);
        return mav;
    }

}
