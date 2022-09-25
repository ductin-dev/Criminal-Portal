package com.covidtracker.controller.admin;

import com.covidtracker.dto.UserDTO;
import com.covidtracker.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "userControllerOfAdmin")
public class UserController {

    @Autowired
    private IUserService userService;

    public static UserDTO userDTO = new UserDTO();

    @RequestMapping(value = "/admin/user/list", method = RequestMethod.GET)
    public ModelAndView showList() {
        ModelAndView mav = new ModelAndView("admin/user/list");
        if (userDTO.getListDTO() == null || userDTO.getListDTO().isEmpty() ) {
            userDTO.setListDTO(userService.findAll());
        }
        mav.addObject("USER_DTO", userDTO);
        return mav;
    }

}
