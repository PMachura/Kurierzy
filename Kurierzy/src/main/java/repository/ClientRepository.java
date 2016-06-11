/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.util.List;
import model.Client;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Przemek
 */
@Repository
public interface ClientRepository extends CrudRepository<Client, Integer> {
    
    List<Client> findAllByName(String name);
    
    @Query("Select c from Client c where c.email like :email")
    public Client findByEmail(@Param("email")String email);
}
