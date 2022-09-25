package com.covidtracker.api.admin;

import com.covidtracker.controller.admin.PatientController;
import com.covidtracker.controller.web.MapHandle;
import com.covidtracker.dto.PatientDTO;
import com.covidtracker.service.IPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "patientAPIOfAdmin")
public class PatientAPI {
    @Autowired
    private IPatientService patientService;

    @PostMapping("/api/patient")
    public PatientDTO createPatient(@RequestBody PatientDTO patientDTO) {
        MapHandle.patientsList=null;
        PatientController.patientDTO.setListDTO(null);
        patientDTO.setStatus(0);
        return patientService.save(patientDTO);
    }

    @PutMapping("/api/patient")
    public PatientDTO updatePatient(@RequestBody PatientDTO updatePatient) {
        MapHandle.patientsList=null;
        PatientController.patientDTO.setListDTO(null);
        return patientService.save(updatePatient);
    }

    @DeleteMapping("/api/patient")
    public void deletePatient(@RequestBody long[] ids) {
        MapHandle.patientsList=null;
        PatientController.patientDTO.setListDTO(null);
        patientService.delete(ids);
    }
}
