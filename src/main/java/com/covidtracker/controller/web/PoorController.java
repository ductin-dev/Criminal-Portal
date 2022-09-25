package com.covidtracker.controller.web;

import com.covidtracker.dto.WheelChairDTO;
import com.covidtracker.service.IWheelChairService;
import com.covidtracker.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller("poorController")
public class PoorController {
    @Autowired
    ServletContext servletContext;

    @Autowired
    IWheelChairService wheelChairService;

    @Autowired
    private MessageUtil messageUtil;
    public static WheelChairDTO wheelChairDTO = new WheelChairDTO();
    @GetMapping("/poor/list")
    public ModelAndView listPoor(HttpServletRequest request){
        ModelAndView mav = new ModelAndView("web/charity/list-poor");
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        wheelChairDTO.setListDTO(wheelChairService.findAllByStatus(1));
        mav.addObject("WHEEL_CHAIR_DTO", wheelChairDTO);
        return mav;
    }

    @GetMapping("/support-register")
    public ModelAndView upload(){
        ModelAndView mav = new ModelAndView("support-register");
        return mav;
    }

}
