/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import model.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import repository.RequestRepository;

/**
 *
 * @author Przemek
 */

@Repository
public class RequestService {
    
    @Autowired
    private RequestRepository requestRepository;
    
    public void save(Request request){
        this.requestRepository.save(request);
    }
              
    public Iterable<Request> findAll(){
        return requestRepository.findAll();
    }
    
    public Request findOne(Integer id){
        return requestRepository.findOne(id);
    }
    
    public void delete(Integer id){
        requestRepository.delete(id);
    }
}
