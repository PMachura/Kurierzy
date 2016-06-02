/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.RequestStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.RequestStatusRepository;

/**
 *
 * @author Przemek
 */

@Service
public class RequestStatusService {
    
    @Autowired 
    RequestStatusRepository requestStatusRepository;
    
    public Iterable<RequestStatus> findAll(){
        return requestStatusRepository.findAll();
    }
    
}   
