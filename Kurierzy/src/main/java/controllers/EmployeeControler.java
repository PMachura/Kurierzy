/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import model.City;
import model.Employee;
import model.Role;
import model.Vehicle;
import org.apache.log4j.Logger;
import org.hibernate.validator.internal.engine.groups.Group;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import service.CityService;
import service.EmployeeService;
import service.RoleService;
import service.VehicleService;
import org.springframework.security.core.userdetails.User;
/**
 *
 * @author Przemek
 */
@Controller
@RequestMapping("/employee")
public class EmployeeControler {

    @Autowired
    VehicleService vehicleService;

    @Autowired
    CityService cityService;

    @Autowired
    RoleService roleService;

    @Autowired
    EmployeeService employeeService;

    protected Logger logger = Logger.getLogger(getClass());

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Set.class, "roles", new CustomCollectionEditor(Set.class) {
            @Override
            protected Object convertElement(Object element) {

                Integer id = null;

                if (element instanceof String && !((String) element).equals("")) {
                    //From the JSP 'element' will be a String

                    try {
                        id = Integer.parseInt((String) element);
                    } catch (NumberFormatException e) {
                        System.out.println("Element was " + ((String) element));
                        e.printStackTrace();
                    }
                } else if (element instanceof Integer) {
                    //From the database 'element' will be a Long
                    id = (Integer) element;
                }

                return id != null ? roleService.findOne(id) : null;
            }
        });

    }
    
    @RequestMapping("/add")
    public String add(Model model) {

        Iterable<Vehicle> vehicles = vehicleService.findNotUsed();
        Iterable<Role> rolesAvaliable = roleService.findAll();
        Iterable<City> cities = cityService.findAll();
        Employee employee = new Employee();

        model.addAttribute("cities", cities);
        model.addAttribute("rolesAvaliable", rolesAvaliable);
        model.addAttribute("vehicles", vehicles);
        model.addAttribute("employee", employee);

        return "employee/add";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam("employeeId") Integer employeeId) {
        employeeService.delete(employeeId);
        return "messages/operationSuccessful";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@RequestParam("employeeId") Integer employeeId,
                       Model model) {
        
        Iterable<Vehicle> vehicles = vehicleService.findNotUsed();
        Iterable<Role> rolesAvaliable = roleService.findAll();
        Iterable<City> cities = cityService.findAll();
        Employee employee = employeeService.findOne(employeeId);

        model.addAttribute("cities", cities);
        model.addAttribute("rolesAvaliable", rolesAvaliable);
        model.addAttribute("vehicles", vehicles);
        model.addAttribute("employee", employee);
        model.addAttribute("edit", true);

        return "employee/add";
    }


@RequestMapping(value ="shipments", method = RequestMethod.GET)
public String shipments(@RequestParam("employeeId")Integer employeeId, Model model){
   Employee employee = employeeService.findOne(employeeId);
   model.addAttribute("employee", employee);
   model.addAttribute("employees", true);
   return "employee/shipments";
}
    
@RequestMapping(value = "/save", method = RequestMethod.POST)
        public String save(@ModelAttribute("employee")
        @Valid Employee employee, BindingResult bindingResult) {

        employeeService.save(employee);
        return "redirect:/";
    }
    
   @RequestMapping("/showAll")
        public String showAll(Model model){
       
       model.addAttribute("employees",employeeService.findAll());
       return "employee/showAll";
   }
   
   @RequestMapping("/show")
        public String show(@RequestParam("id") Integer requestId, @RequestParam("back") String back, Model model){
       Employee employee = employeeService.findOne(requestId);
       model.addAttribute("employee",employee);
       if(back.equals("employees")) {
           model.addAttribute("employees", true);
       }
       if(back.equals("requests")) {
           model.addAttribute("requests", true);
       }
       if(back.equals("shipments")) {
           model.addAttribute("shipments", true);
       }
       
       return "employee/show";
   }
        
   @RequestMapping("/myShipments")
   public String myShipments(Model model){
       User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
       Employee employee = employeeService.findByEmail(user.getUsername());
       model.addAttribute("employee",employee);
       return "employee/shipments";
   }

}
