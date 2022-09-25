package com.covidtracker.api.admin;

import com.covidtracker.controller.admin.RoleController;
import com.covidtracker.dto.RoleDTO;
import com.covidtracker.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "roleAPIOfAdmin")

public class RoleAPI {
    @Autowired
    private IRoleService roleService;

    @PostMapping("/api/role")
    public RoleDTO createRole(@RequestBody RoleDTO roleDTO) {
        RoleController.roleDTO.setListDTO(null);
        return roleService.save(roleDTO);
    }

    @PutMapping("/api/role")
    public RoleDTO updateRole(@RequestBody RoleDTO updateRole)
    {
        RoleController.roleDTO.setListDTO(null);
        return roleService.save(updateRole);
    }

    @DeleteMapping("/api/role")
    public void deleteRole(@RequestBody long[] ids) {
        RoleController.roleDTO.setListDTO(null);
        roleService.delete(ids);
    }
}
