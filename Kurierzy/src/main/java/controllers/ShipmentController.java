/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.validation.Valid;
import model.City;
import model.Employee;
import model.Shipment;
import model.ShipmentStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.CityService;

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

    @Autowired
    CityService cityService;

    @RequestMapping("/showAll")
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

        Iterable<City> cities = cityService.findAll();
        Iterable<ShipmentStatus> shipmentStatuses = shipmentStatusService.findAll();

        model.addAttribute("cities", cities);
        model.addAttribute("shipment", shipment);
        model.addAttribute("shipmentStatuses", shipmentStatuses);
        return "shipment/add";

    }

    @RequestMapping("/assignEmployee")
    public String assignEmployee(@RequestParam(value = "shipmentId", required = false) Integer shipmentId,
            @RequestParam(value = "employeeId", required = false) Integer employeeId,
            Model model) {

        Iterable<Employee> employees = employeeService.findAllByRole("ROLE_COURIER");
//        Iterable<Employee> employees = employeeService.findAll();

        model.addAttribute("employees", employees);
        model.addAttribute("shipmentId", shipmentId);
        model.addAttribute("employeeId", employeeId);

        return "employee/assignToShipment";

    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@RequestParam("shipmentId") Integer shipmentId,
           @RequestParam("back") String back ,Model model) {

        Shipment shipment = shipmentService.findOne(shipmentId);
        Iterable<ShipmentStatus> shipmentStatuses = shipmentStatusService.findAll();
        Iterable<City> cities = cityService.findAll();

        model.addAttribute("shipmentStatuses", shipmentStatuses);
        model.addAttribute("shipment", shipment);
        model.addAttribute("cities", cities);
        model.addAttribute("edit", true);
        model.addAttribute("back", back);
 
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

    @RequestMapping("/delete")
    public String delete(@RequestParam("shipmentId") Integer shipmentId) {
        shipmentService.delete(shipmentId);
        return "messages/operationSuccessful";
    }

    @RequestMapping("/show")
    public String show(@RequestParam("id") Integer shipmentId, @RequestParam("back") String back ,Model model) {

        Shipment shipment = shipmentService.findOne(shipmentId);
        model.addAttribute("shipment", shipment);
        if(back.equals("myShipments")) {
            model.addAttribute("myShipments", true);
        }
        if(back.equals("showAll")) {
            model.addAttribute("showAll", true);
        }

        return "shipment/show";
    }
}
