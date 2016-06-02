/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.validation.Valid;
import model.Employee;
import model.Shipment;
import model.ShipmentStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.EmployeeService;
import service.ShipmentService;
import service.ShipmentStatusService;

/**
 *
 * @author Przemek
 */
@Controller
@RequestMapping("/shipment")
public class ShipmentController {

    @Autowired
    ShipmentService shipmentService;

    @Autowired
    EmployeeService employeeService;
    
    @Autowired
    ShipmentStatusService shipmentStatusService;

    @RequestMapping("/show")
    public String showAll(Model model) {
        model.addAttribute("shipments", shipmentService.findAll());
        return "shipment/showAll";
    }

    @RequestMapping("/add")
    public String add(Model model,
            @RequestParam(value = "employeeId", required = false) Integer employeeId,
            @RequestParam(value = "shipmentId", required = false) Integer shipmentId) {

        Shipment shipment;
        if (shipmentId == null) {
            shipment = new Shipment();
            if (employeeId != null) {
                Employee employee = employeeService.findOne(employeeId);
                shipment.setEmployee(employee);
            }
        } else {
            shipment = shipmentService.findOne(shipmentId);
            if (employeeId != null) {
                Employee employee = employeeService.findOne(employeeId);
                shipment.setEmployee(employee);
            }
        }

        Iterable<ShipmentStatus> shipmentStatuses = shipmentStatusService.findAll();
        
        model.addAttribute("shipment", shipment);
        model.addAttribute("shipmentStatuses",shipmentStatuses);
        return "shipment/add";

    }

    @RequestMapping("/assignEmployee")
    public String assignEmployee(@ModelAttribute("shipment") Shipment shipment,
            Model model) {

        Iterable<Employee> employees = employeeService.findAll();

        System.out.println("@@@@@@ SHIPMENT ID: " + shipment.getId());
        
        model.addAttribute("employees", employees);
        model.addAttribute("shipment", shipment);
        model.addAttribute("assignToShipment", true);

        return "employee/showAll";

    }
    
    @RequestMapping("/save")
    public String save(@ModelAttribute("shipment") @Valid Shipment shipment,
                       BindingResult bindingResult,
                       Model model){
        if(bindingResult.hasErrors()){
            return "shipment/add";
        }
        
       shipmentService.save(shipment);
        
        return "redirect:/";
    }
}
