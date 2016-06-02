/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.validation.Valid;
import model.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import service.VehicleService;

/**
 *
 * @author Przemek
 */
@Controller
@RequestMapping("/vehicle")
public class VehicleController {
    
    @Autowired
    VehicleService vehicleService;
    
    @RequestMapping("/add")
    public String add(Model model){
        Vehicle vehicle = new Vehicle();
        model.addAttribute("vehicle", vehicle);
        return "vehicle/add";
    }
    
    @RequestMapping("/save")
    public String save(@ModelAttribute("vehicle")@Valid Vehicle vehicle, BindingResult bindingResult){
        
        if(bindingResult.hasErrors()){
            return "vehicle/add";
        }
        
        vehicleService.save(vehicle);
        return "redirect:/";
    }
}
