package com.covidtracker.controller.web;

import com.covidtracker.dto.CharityDTO;
import com.covidtracker.dto.UserDTO;
import com.covidtracker.service.IAreaService;
import com.covidtracker.service.ICharityService;
import com.covidtracker.service.IPatientService;
import com.covidtracker.service.IUserService;
import com.covidtracker.util.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import java.util.Map;

@Controller(value = "homeControllerOfWeb")
public class HomeController {

    @Autowired
    private IPatientService patientService;

    @Autowired
    private IAreaService areaService;

    @Autowired
    private ICharityService charityService;

    @Autowired
    private IUserService userService;

    @Autowired
    private MessageUtil messageUtil;


    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage() {
        MapHandle map = new MapHandle();
        ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("stringPatients", map.stringPatients(patientService));
        mav.addObject("stringAreas", map.stringAreas(areaService));
        mav.addObject("stringCharity", map.stringCharity(charityService));
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage() {
		return new ModelAndView("login");
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public ModelAndView accessDenied() {
        return new ModelAndView("redirect:/login?accessDenied");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:trang-chu";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView register(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("register");
        UserDTO userDTO = new UserDTO();
        if (request.getParameter("message") != null) {
            Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
            mav.addObject("message", message.get("message"));
            mav.addObject("alert", message.get("alert"));
        }
        mav.addObject("USER_DTO", userDTO);
        return mav;
    }

    @RequestMapping(value = "/charity/custom/list", method = RequestMethod.GET)
    public ModelAndView listCustomCharity(HttpServletRequest request ,@RequestParam(value = "userName", required = false) String userName) {
        ModelAndView mav = new ModelAndView("web/my-charity/list");
        if (request.getSession().getAttribute("CHARITY_CUSTOM")==null) {
            CharityDTO charityDTO = new CharityDTO();
            if (userName != null) {
                charityDTO.setListDTO(charityService.findAllByCreateBy(userName));
            }
            request.getSession().setAttribute("CHARITY_CUSTOM",charityDTO);
        }
        mav.addObject("CHARITY_CUSTOM", request.getSession().getAttribute("CHARITY_CUSTOM"));
        return mav;
    }

    @RequestMapping(value = "/charity/custom/edit", method = RequestMethod.GET)
    public ModelAndView editCharityCustom(@RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("web/my-charity/edit");
        CharityDTO charityDTO = new CharityDTO();
        if (id != null) {
            charityDTO = charityService.findById(id);
        }
        mav.addObject("CHARITY_CUSTOM", charityDTO);
        return mav;
    }

    @RequestMapping(value = "/sign-up/charity", method = RequestMethod.GET)
    public ModelAndView updateRoleUser(@RequestParam(value = "userName", required = false) String userName) {
        ModelAndView mav = new ModelAndView("web/sign-up-charity");
        UserDTO userDTO = new UserDTO();
        if (userName != null) {
            userDTO = userService.findByUserName(userName);
        }
        mav.addObject("USER_SIGNUP", userDTO);
        return mav;
    }

    @RequestMapping(value = "/wheelchair-check", method = RequestMethod.GET)
    public ModelAndView wheelchairAPI() {
        return new ModelAndView("web/comfirm-charity");
    }

    @RequestMapping(value = "/countrylevel", method = RequestMethod.GET)
    public ModelAndView rDataAnalysis1() {
        return new ModelAndView("countrylevel");
    }

    @RequestMapping(value = "/citylevel", method = RequestMethod.GET)
    public ModelAndView rDataAnalysis2() {
        return new ModelAndView("citylevel");
    }

    @RequestMapping(value = "/visualage", method = RequestMethod.GET)
    public ModelAndView biDataAnalysis1() {
        return new ModelAndView("visualage");
    }

    @RequestMapping(value = "/visualday", method = RequestMethod.GET)
    public ModelAndView biDataAnalysis2() {
        return new ModelAndView("visualday");
    }

    @RequestMapping(value = "/visualcity", method = RequestMethod.GET)
    public ModelAndView biDataAnalysis3() {
        return new ModelAndView("visualcity");
    }
}