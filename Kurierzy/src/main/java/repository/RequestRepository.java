/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;


import model.Request;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Przemek
 */
public interface RequestRepository extends CrudRepository<Request, Integer> {
    
    @Query("select r from Request r  where r.shipment.id = :shipmentId")
    Iterable<Request> findByShipmentId(@Param("shipmentId")Integer shipmentId);
    
}
