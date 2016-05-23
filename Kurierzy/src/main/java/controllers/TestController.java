/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Przemek
 */


class User{
    
}


@Controller
@RequestMapping("/test")
public class TestController {
    
    
    @RequestMapping("/view")
    public String view(Model model){
        model.addAttribute("name", new String());
        return "test";
    }
    
    @RequestMapping("/inputs")
    public String inputs(Model model, @ModelAttribute("name") String name,
            @RequestParam(value="fruit", required=false) String fruit,
            @RequestParam(value="taste", required=false) String taste){
        
        if(fruit!=null){
            System.out.println("*******************************"+fruit);
        }
        if(taste!=null){
            System.out.println("*******************************"+taste);
        }
         if(name!=null){
            System.out.println("*******************************"+name);
        }
       
        return "test";
    }
}
