package com.covidtracker.controller.admin;

import com.covidtracker.dto.WheelChairDTO;
import com.covidtracker.service.IWheelChairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "poorControllerOfAdmin")
public class PoorController {
    @Autowired
    IWheelChairService wheelChairService;

    public static WheelChairDTO wheelChairDTO = new WheelChairDTO();

    @RequestMapping(value = "/admin/poor/list", method = RequestMethod.GET)
    public ModelAndView listArea() {
        ModelAndView mav = new ModelAndView("admin/poor/list");
        if (wheelChairDTO.getListDTO()==null || wheelChairDTO.getListDTO().isEmpty()) {
            wheelChairDTO.setListDTO(wheelChairService.findAll());
        }
        mav.addObject("POOR_DTO", wheelChairDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/poor/edit", method = RequestMethod.GET)
    public ModelAndView editArea(@RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("admin/poor/edit");
        if (id != null) {
            wheelChairDTO = wheelChairService.findById(id);
        }
        mav.addObject("POOR_DTO", wheelChairDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/poor/new", method = RequestMethod.GET)
    public ModelAndView newArea() {
        ModelAndView mav = new ModelAndView("admin/poor/new");
        mav.addObject("POOR_DTO", wheelChairDTO);
        return mav;
    }
}
