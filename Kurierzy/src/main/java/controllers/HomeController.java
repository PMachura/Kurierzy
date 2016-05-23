/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Przemek
 */
@Controller
public class HomeController {

    protected Logger logger = Logger.getLogger(getClass());

    @RequestMapping("/")  // na jaki request ten kontroller będzie odpowiadał , na url home.htm bedzie reagowac ta metoda
    public String home(Model model) {

        logger.debug("MyController.home()");

        return "index";
    }
}
