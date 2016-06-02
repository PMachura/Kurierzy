/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import javax.validation.Valid;
import model.Client;
import model.Request;
import model.RequestStatus;
import model.Shipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.CityService;
import service.ClientService;
import service.RequestService;
import service.RequestStatusService;
import service.ShipmentService;

/**
 *
 * @author Przemek
 */
@Controller
@RequestMapping("/request")
public class RequestController {

    @Autowired
    CityService cityService;

    @Autowired
    ClientService clientService;

    @Autowired
    RequestService requestService;

    @Autowired
    RequestStatusService requestStatusService;

    @Autowired
    ShipmentService shipmentService;

    @RequestMapping("/addByClient")
    public String addByClient(Model model) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Client client = clientService.findByEmail(user.getUsername());

        Request request = new Request();
        request.setClient(client);
        model.addAttribute("request", request);
        model.addAttribute("cities", cityService.findAll());
        
        return "request/addByClient";
    }

   
    
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("request") @Valid Request order, BindingResult bindingResult) {

        /**
         * W przypadku błędów przekierowanie za pomocą forward do
         * /client/add.htm
         */
        if (bindingResult.hasErrors()) {
            return "request/make";
        }

        requestService.save(order);

        return "redirect:/";

    }

    @RequestMapping("/showAll")
    public String showAll(Model model) {

        Iterable<Request> requests = requestService.findAll();
        model.addAttribute("requests", requests);

        return "request/showAll";
    }

    @RequestMapping("/edit")
    public String edit(Model model, 
                       @RequestParam("id") Integer requestId,
                       @RequestParam(value="shipmentId", required=false) Integer shipmentId) {

        Request request = requestService.findOne(requestId);
        Iterable<RequestStatus> requestStatuses = requestStatusService.findAll();
        Iterable<Shipment> shipments = shipmentService.findAll();
        
        if(shipmentId!=null){
            Shipment shipment = shipmentService.findOne(shipmentId);      
            request.setShipment(shipment);
        }

        
        model.addAttribute("request", request);
        model.addAttribute("cities", cityService.findAll());
        model.addAttribute("requestStatuses", requestStatuses);
        model.addAttribute("edit", true);

        return "request/make";

    }

    @RequestMapping("/assignShipment")
    public String assignShipment(@ModelAttribute("request") Request request,
            Model model) {

        Iterable<Shipment> shipments = shipmentService.findAll();
        model.addAttribute("shipments", shipments);
        model.addAttribute("request", request);
        if (request != null) {
            model.addAttribute("assignToOrder", true);
        }

        return "shipment/show";
    }

}
