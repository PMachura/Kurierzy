/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import repository.ClientRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author Przemek
 */

@Service("clientService")
public class ClientService {
    
    @Autowired
    private ClientRepository clientRepository;
    
    
    public Iterable <Client> findAll(){
        return clientRepository.findAll();
    }
    
    public Client findOne(Integer id){
        return clientRepository.findOne(id);
    }
    
    public Client findByEmail(String email){
        return clientRepository.findByEmail(email);
    }
    
    public void save(Client client){
        clientRepository.save(client);
    }
    
    public List<Client> findAllByName(String name){
        return clientRepository.findAllByName(name);
    }
           
    public void delete(Integer id){
       clientRepository.delete(id);
    }
}
