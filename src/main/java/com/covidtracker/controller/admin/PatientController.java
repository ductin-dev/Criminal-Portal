package com.covidtracker.controller.admin;

import com.covidtracker.dto.PatientDTO;
import com.covidtracker.service.IPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "patientControllerOfAdmin")
public class PatientController {

    @Autowired
    private IPatientService patientService;

    public static PatientDTO patientDTO=new PatientDTO();

    @RequestMapping(value = "/admin/patient/list", method = RequestMethod.GET)
    public ModelAndView showList() {
        ModelAndView mav = new ModelAndView("admin/patient/list");
        if (patientDTO.getListDTO() ==null || patientDTO.getListDTO().isEmpty()) {
            patientDTO.setListDTO(patientService.findAll());
        }
        mav.addObject("PATIENT_DTO", patientDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/patient/edit", method = RequestMethod.GET)
    public ModelAndView editPatient(@RequestParam(value = "id", required = false) Long id) {
        ModelAndView mav = new ModelAndView("admin/patient/edit");
        if (id != null) {
            patientDTO = patientService.findById(id);
        }
        mav.addObject("PATIENT_DTO", patientDTO);
        return mav;
    }

    @RequestMapping(value = "/admin/patient/new", method = RequestMethod.GET)
    public ModelAndView newPatient() {
        ModelAndView mav = new ModelAndView("admin/patient/new");
        mav.addObject("PATIENT_DTO", patientDTO);
        return mav;
    }

}
