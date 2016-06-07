/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Map;
import javax.validation.Valid;
import model.Client;
import model.Request;
import model.Shipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.CityService;
import service.ClientService;
import service.RequestService;
import service.ShipmentService;

/**
 *
 * @author Przemek
 */
@Controller
@RequestMapping("/client")
public class ClientController {

    /**
     * Automatyczne wstrzykniecie clientDAO
     */
    @Autowired
    ClientService clientService;

    @Autowired
    CityService cityService;

    @Autowired
    RequestService requestService;

    @Autowired
    ShipmentService shipmentService;

    @RequestMapping("/register")
    public String register(Model model) {

        model.addAttribute("client", new Client());
        model.addAttribute("cities", cityService.findAll());
        return "client/register";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("client") @Valid Client client, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("cities", cityService.findAll());
            return "/client/register";
        }
        clientService.save(client);
//        return "redirect:/client/profile?id=" + client.getId();
        return "redirect:/";
    }

    @RequestMapping("/myProfile")
    public String myProfile(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Client client = clientService.findByEmail(user.getUsername());
        model.addAttribute("client", client);
        return "client/profile";
    }

    @RequestMapping("/editMyProfile")
    public String editMyProfile(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Client client = clientService.findByEmail(user.getUsername());
        model.addAttribute("client", client);
        model.addAttribute("cities", cityService.findAll());
        return "client/edit";
    }

    @RequestMapping("/myRequests")
    public String showMyRequests(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Client client = clientService.findByEmail(user.getUsername());
        model.addAttribute("client", client);
        return "client/requests";
    }

    @RequestMapping(value = "/myRequest", method = RequestMethod.POST)
    public String myRequest(Model model,
            @RequestParam("requestId") Integer requestId) {

        Request request = requestService.findOne(requestId);
        model.addAttribute("request", request);

        return "request/show";
    }

    @RequestMapping(value = "/myShipment", method = RequestMethod.POST)
    public String myShipment(Model model,
            @RequestParam("shipmentId") Integer shipmentId) {

        Shipment shipment = shipmentService.findOne(shipmentId);
        model.addAttribute("shipment",shipment);
        
        return "shipment/show";
    }

    @RequestMapping("/update")
    public String updateMyProfile(@ModelAttribute("client") @Valid Client client, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/edit";
        }
        clientService.save(client);
        return "redirect:/client/profile?id=" + client.getId();
    }

    @RequestMapping("/profile")
    public String profile(Model model,
            @RequestParam("id") Integer clientId) {

        Client client = clientService.findOne(clientId);
        model.addAttribute("client", client);
        return "client/profile";
    }

    /*
    @RequestMapping(value = "/{clientId}")
    public String getProfile(@PathVariable("clientId") String clientId, Map<String, Object> model) {

        Client client = clientService.findOne(Integer.parseInt(clientId));
        model.put("client", client);
        return "client/profile";
    }
  
    @RequestMapping(value = "/{clientId}/edit", method = RequestMethod.GET)
    public String editProfile(@PathVariable("clientId") String clientId, Map<String, Object> model) {
        Client client = clientService.findOne(Integer.parseInt(clientId));
        model.put("client", client);
        model.put("cities", cityService.findAll());
        return "client/edit";
    }

    @RequestMapping(value = "/{clientId}/update")
    public String getProfile(@ModelAttribute("client") @Valid Client client, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "client/edit";
        }

        clientService.save(client);

        return "redirect:/client/" + client.getId() + ".htm";
    }
     */
}
