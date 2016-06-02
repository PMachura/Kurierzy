/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Przemek
 */

class Phone{
    Integer number;
    String name;

    @Override
    public String toString() {
        return "Phone{" + "number=" + number + ", name=" + name + '}';
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}

class Item{
    String name;
    Float weight;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    @Override
    public String toString() {
        return "Item{" + "name=" + name + ", weight=" + weight + '}';
    }
    
}
class User{
    Integer age;
    String name;
    List<Item> items= new ArrayList<Item>(0);
    Phone phone;

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "User{" + "age=" + age + ", name=" + name + ", items=" + items + ", phone=" + phone + '}';
    }

    
    
}


@Controller
@RequestMapping("/test")
public class TestController {
    
    @RequestMapping("/pushUser")
    public String pushUser(Model model){
        
        Item item = new Item();
        item.setName("Portfel");
        item.setWeight(new Float(3));
        
        List<Item> items = new ArrayList<Item>();
        items.add(item);
        
        Phone phone = new Phone();
        phone.setName("Samsung");
        phone.setNumber(605523564);
        
        User user = new User();
        user.setAge(34);
        user.setName("Romek");
        user.setItems(items);
        
        model.addAttribute("user",user);
        
        return "test/test";
        
    }
    
    @RequestMapping("/receiveUser")
    public String receiveUser(@ModelAttribute("user")User user, Model model){
        
        System.out.println("@@@@@USER INFO: "+user);
        return "test/test";
    }
    
    
    @RequestMapping("/view")
    public String view(Model model){
        model.addAttribute("name", new String());
        return "test/test";
    }
    
    @RequestMapping("/inputs")
    public String inputs(Model model, @ModelAttribute("name") String name,
            @RequestParam(value="fruit", required=false) String fruit,
            @RequestParam(value="taste", required=false) String taste,
            @RequestParam(value="color", required=false) String [] color){
        
        if(fruit!=null){
            System.out.println("***********FRUIT********************"+fruit);
        }
        if(taste!=null){
            System.out.println("**********TASTE*********************"+taste);
        }
         if(name!=null){
            System.out.println("**********NAME*********************"+name);
        }
        
         if(color != null){
             for(String c :color){
                 System.out.println("******COLOR*******" + c);
                 System.out.println("******COLOR22*******" + c);
             }
         }
       
        return "test/test";
    }
}
