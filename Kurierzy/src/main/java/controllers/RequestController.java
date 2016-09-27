/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import javax.validation.Valid;
import model.City;
import model.Client;
import model.Request;
import model.RequestStatus;
import model.Shipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
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
import service.RoleService;
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
    RoleService roleService;

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

    @RequestMapping("/addByEmployee")
    public String addByEmployee(@RequestParam(value = "requestId", required = false) Integer requestId,
            @RequestParam(value = "shipmentId", required = false) Integer shipmentId,
            @RequestParam(value = "clientId", required = false) Integer clientId,
            Model model) {

        Request request;
        if (requestId != null) {
            request = requestService.findOne(requestId);
        } else {
            request = new Request();
        }

        if (shipmentId != null) {
            Shipment shipment = shipmentService.findOne(shipmentId);
            request.setShipment(shipment);
        }
        if (clientId != null) {
            Client client = clientService.findOne(clientId);
            request.setClient(client);
        }

        Iterable<RequestStatus> requestStatuses = requestStatusService.findAll();

        model.addAttribute("requestStatuses", requestStatuses);
        model.addAttribute("request", request);
        model.addAttribute("cities", cityService.findAll());

        return "request/addByEmployee";
    }

    @RequestMapping("/assignShipment")
    public String assignShipment(@RequestParam(value = "requestId", required = true) Integer requestId,
            @RequestParam(value = "shipmentId", required = false) Integer shipmentId,
            @RequestParam(value = "clientId", required = false) Integer clientId,
            Model model) {

        Iterable<Shipment> shipments = shipmentService.findAll();

        model.addAttribute("shipments", shipments);
        model.addAttribute("requestId", requestId);
        model.addAttribute("shipmentId", shipmentId);
        model.addAttribute("clientId", clientId);

        return "shipment/assignToOrder";
    }

    @RequestMapping("/assignClient")
    public String assignClient(@RequestParam(value = "requestId", required = true) Integer requestId,
            @RequestParam(value = "shipmentId", required = false) Integer shipmentId,
            @RequestParam(value = "clientId", required = false) Integer clientId,
            Model model) {

        Iterable<Client> clients = clientService.findAll();

        model.addAttribute("clients", clients);
        model.addAttribute("requestId", requestId);
        model.addAttribute("shipmentId", shipmentId);
        model.addAttribute("clientId", clientId);

        return "client/assignToOrder";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam(value = "addType") String addType, @ModelAttribute("request")
            @Valid Request order, BindingResult bindingResult) {

        /**
         * W przypadku błędów przekierowanie za pomocą forward do
         * /client/add.htm
         */
        if (bindingResult.hasErrors()) {
            if (addType.equals("client")) {
                return "redirect:/request/addByClient";
            } else {
                return "redirect:/request/addByEmployee";
            }
        }

        requestService.save(order);

        return "redirect:/";

    }

    @RequestMapping("/showAll")
    public String showAll(Model model) {

        Iterable<Request> requests = requestService.findAll();
        Iterable<RequestStatus> requestStatuses = requestStatusService.findAll();

        model.addAttribute("requestStatuses", requestStatuses);
        model.addAttribute("requests", requests);

        return "request/showAll";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(Model model,
            @RequestParam("requestId") Integer requestId) {

        Request request = requestService.findOne(requestId);
        Iterable<RequestStatus> requestStatuses = requestStatusService.findAll();
        Iterable<City> cities = cityService.findAll();

        model.addAttribute("request", request);
        model.addAttribute("cities", cities);
        model.addAttribute("requestStatuses", requestStatuses);
        model.addAttribute("edit", true);

        return "request/addByEmployee";

    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("requestId") Integer requestId) {
        requestService.delete(requestId);
        return "redirect:/request/showAll";
    }

}
