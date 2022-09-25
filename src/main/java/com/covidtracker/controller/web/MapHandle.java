package com.covidtracker.controller.web;

import com.covidtracker.dto.AreaDTO;
import com.covidtracker.dto.CharityDTO;
import com.covidtracker.dto.PatientDTO;
import com.covidtracker.service.IAreaService;
import com.covidtracker.service.IPatientService;
import com.covidtracker.service.ICharityService;

public class MapHandle {

    public static String patientsList=null;
    public static String areaList=null;
    public static String charityList=null;

    public String stringPatients(IPatientService patientService) {
        if (!(patientsList==null)) return patientsList;
        PatientDTO patientDTO = new PatientDTO();
        patientDTO.setListDTO(patientService.findAll());
        StringBuilder sb = new StringBuilder("");
        for (PatientDTO p : patientDTO.getListDTO()) {
            sb.append(p.getBnX() + "<SPLIT_MARK> ");
            sb.append(p.getBnY() + "<SPLIT_MARK> ");
            sb.append(p.getCode() + "(" + p.getName() + ")" + "<SPLIT_MARK> ");
            sb.append(p.getAddress() + "<SPLIT_MARK> ");
            sb.append(p.getStatus() + "<SPLIT_MARK> ");
            sb.append( p.getId() + "<SPLIT_MARK> ");
        }
        patientsList = sb.toString();
        patientsList = patientsList.replaceAll(System.getProperty("line.separator"), "<br>");
        return patientsList;
    }

    public String stringAreas(IAreaService areaService) {
        if (!(areaList==null)) return areaList;
        AreaDTO areaDTO = new AreaDTO();
        areaDTO.setListDTO(areaService.findAll());
        StringBuilder sb = new StringBuilder("");
        for (AreaDTO a : areaDTO.getListDTO()) {
            sb.append(a.getaX() + "<SPLIT_MARK> ");
            sb.append(a.getaY() + "<SPLIT_MARK> ");
            sb.append(a.getAddress() + "<SPLIT_MARK> ");
            sb.append(a.getDetail() + "<SPLIT_MARK> ");
        }
        areaList = sb.toString();
        areaList = areaList.replaceAll(System.getProperty("line.separator"), "<br>");
        return areaList;
    }

    public String stringCharity(ICharityService charityService) {
        if (!(charityList==null)) return charityList;
        CharityDTO charityDTO = new CharityDTO();
        charityDTO.setListDTO(charityService.findAll());
        StringBuilder sb = new StringBuilder("");
        for (CharityDTO c : charityDTO.getListDTO()) {
            sb.append(c.getcX() + "<SPLIT_MARK> ");
            sb.append(c.getcY() + "<SPLIT_MARK> ");
            sb.append(c.getName() + "<SPLIT_MARK> ");
            sb.append(c.getAddress() + "<SPLIT_MARK> ");
            sb.append(c.getContent() + "<SPLIT_MARK> ");
        }
        charityList = sb.toString();
        charityList = charityList.replaceAll(System.getProperty("line.separator"), "<br>");
        return charityList;
    }


}
