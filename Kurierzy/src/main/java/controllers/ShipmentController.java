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
            System.out.println("@@@@@@@@@@@ PUSTO");
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
        model.addAttribute("shipmentStatuses", shipmentStatuses);
        return "shipment/add";

    }

    @RequestMapping("/assignEmployee")
    public String assignEmployee(@RequestParam(value = "shipmentId", required = false) Integer shipmentId,
                                 @RequestParam(value = "employeeId", required = false) Integer employeeId,
                                 Model model) {

        Iterable<Employee> employees = employeeService.findAll();

      
        model.addAttribute("employees", employees);
        model.addAttribute("shipmentId", shipmentId);
        model.addAttribute("employeeId", employeeId);

        return "employee/assignToShipment";

    }
    
    @RequestMapping("/edit")
    public String edit(@RequestParam("id") Integer shipmentId,
                       Model model){
        
        Shipment shipment = shipmentService.findOne(shipmentId);
        Iterable<ShipmentStatus> shipmentStatuses = shipmentStatusService.findAll();
        model.addAttribute("shipmentStatuses", shipmentStatuses);
        
        model.addAttribute("shipment",shipment);
        return "shipment/add";
    }
            
    @RequestMapping("/save")
    public String save(@ModelAttribute("shipment") @Valid Shipment shipment,
            BindingResult bindingResult,
            Model model) {
        if (bindingResult.hasErrors()) {
            return "shipment/add";
        }

        shipmentService.save(shipment);

        return "redirect:/";
    }
}
