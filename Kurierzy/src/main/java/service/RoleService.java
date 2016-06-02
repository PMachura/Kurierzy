/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.RoleRepository;

/**
 *
 * @author Przemek
 */

@Service
public class RoleService {
    
    @Autowired
    RoleRepository roleRepository;
    
    public Iterable<Role> findAll(){
        return roleRepository.findAll();
    }
    
    public Role findOne(Integer id){
        return roleRepository.findOne(id);
    }
}
