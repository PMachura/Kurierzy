/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ShipmentService;

/**
 *
 * @author Przemek
 */
@Controller
@RequestMapping("/shipment")
public class ShipmentController {
    
    @Autowired
    ShipmentService shipmentService;
    
    @RequestMapping("/show")
    public String showAll(Model model){
        model.addAttribute("shipments", shipmentService.findAll());
        return "shipment/show";
    }
}
