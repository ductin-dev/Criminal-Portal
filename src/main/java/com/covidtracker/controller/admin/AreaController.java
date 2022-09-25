package com.covidtracker.controller.admin;

import com.covidtracker.dto.AreaDTO;
import com.covidtracker.service.IAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "areaControllerOfAdmin")
public class AreaController {

    @Autowired
    private IAreaService areaService;

    public static AreaDTO areaDTO=new AreaDTO();

    @RequestMapping(value = "/admin/area/list", method = RequestMethod.GET)
    public ModelAndView listArea() {
        ModelAndView mav = new ModelAndView("admin/area/list");
        if (areaDTO.getListDTO()==null || areaDTO.getListDTO().isEmpty()) {
            areaDTO.setListDTO(areaService.findAll());
        }
        mav.addObject("AREA_DTO", areaDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/area/edit", method = RequestMethod.GET)
    public ModelAndView editArea(@RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("admin/area/edit");
        if (id != null) {
            areaDTO = areaService.findById(id);
        }
        mav.addObject("AREA_DTO", areaDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/area/new", method = RequestMethod.GET)
    public ModelAndView newArea() {
        ModelAndView mav = new ModelAndView("admin/area/new");
        mav.addObject("AREA_DTO", areaDTO);
        return mav;
    }

}
