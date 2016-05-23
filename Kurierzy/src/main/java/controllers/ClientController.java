/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import java.util.Map;
import javax.validation.Valid;
import model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import repository.CityRepository;
import repository.ClientRepository;
import service.CityService;
import service.ClientService;
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
    
  
    
    @RequestMapping("/register")
    public String register(Model model){
        
       // ModelAndView model = new ModelAndView("client/register");
        model.addAttribute("client", new Client());
        model.addAttribute("cities", cityService.findAll());
        return "client/register";
    }
    
    /**
     * Informacja, że dane przekazywane są metodą post
     * Validacja po stronie serwera
     * Efekty bindowania (komunikaty o błędach) przekazane zostają do obiektu bindingResult
     * @ModelAttribute ustawiamy atrybut w modelu przzez adnotacje
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("client") @Valid Client client, BindingResult bindingResult ){
        
        /**
         * W przypadku błędów
         * przekierowanie za pomocą forward do /client/add.htm
         */
        if(bindingResult.hasErrors()){
           return "client/register"; 
        }
        
        clientService.save(client);
       
        return "redirect:/client/" +client.getId() +".htm";
        //return "redirect:/client/getProfileAfterRegistration/"+client.getId()+".htm";
    }
    
    
    
    /**
     * !!! TO NIE DZIALA
     */
    // Tutaj jest tworzony wzorzec url, jaki będzie przechwytywany przez ta metodę -czyli wszystko po /client/getProfileAfterRegistration/*.htm bedzie trafiac tutaj
    @RequestMapping(value="/{clientId}")
    public String getProfile(@PathVariable("clientId") String clientId, Map<String, Object> model){
        
        Client client = clientService.findOne(Integer.parseInt(clientId));
        model.put("client", client);
        return "client/profile";
    }
    
    @RequestMapping(value="/{clientId}/edit" , method = RequestMethod.GET)
    public String editProfile(@PathVariable("clientId") String clientId, Map<String, Object> model){
        Client client =clientService.findOne(Integer.parseInt(clientId));   
        model.put("client", client);
        model.put("cities", cityService.findAll());
        return "client/edit";
    }
    
    @RequestMapping(value="/{clientId}/update")
    public String getProfile(@ModelAttribute("client") @Valid Client client, BindingResult bindingResult){
        
        if(bindingResult.hasErrors()){
           return "client/edit"; 
        }
        
        clientService.save(client);
       
        return "redirect:/client/" +client.getId() +".htm";
    }
}
