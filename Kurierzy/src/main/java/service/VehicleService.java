/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.VehicleRepository;

/**
 *
 * @author Przemek
 */

@Service
public class VehicleService {
    
    @Autowired
    VehicleRepository vehicleRepository;
    
    public Iterable<Vehicle> findNotUsed(){
        return vehicleRepository.findNotUsed();
    }
    
    public void save(Vehicle vehicle){
         vehicleRepository.save(vehicle);
    }
}
