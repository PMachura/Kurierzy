/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.ShipmentStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ShipmentStatusRepository;

/**
 *
 * @author Przemek
 */

@Service
public class ShipmentStatusService {

    @Autowired
    ShipmentStatusRepository shipmentStatusRepository;
    
    public Iterable<ShipmentStatus> findAll(){
        return shipmentStatusRepository.findAll();
    }
    
  
}