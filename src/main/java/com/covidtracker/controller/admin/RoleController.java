package com.covidtracker.controller.admin;

import com.covidtracker.dto.RoleDTO;
import com.covidtracker.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "roleControllerOfAdmin")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    public static RoleDTO roleDTO = new RoleDTO();

    @RequestMapping(value = "/admin/role/list", method = RequestMethod.GET)
    public ModelAndView showList() {
        ModelAndView mav = new ModelAndView("admin/role/list");
        if (roleDTO.getListDTO()==null || roleDTO.getListDTO().isEmpty()) {
            roleDTO.setListDTO(roleService.findAll());
        }
        mav.addObject("ROLE_DTO", roleDTO);
        return mav;
    }

}
