/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Shipment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.ShipmentRepository;

/**
 *
 * @author Przemek
 */
@Service
public class ShipmentService {

    @Autowired
    ShipmentRepository shipmentRepository;
    
    public Iterable<Shipment> findAll(){
        return shipmentRepository.findAll();
    }

}
