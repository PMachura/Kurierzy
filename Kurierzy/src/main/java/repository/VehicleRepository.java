/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import model.Vehicle;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Przemek
 */

@Repository
public interface VehicleRepository extends CrudRepository<Vehicle,Integer>{
    
    @Query("select v from Vehicle v where v.id=11 or v.id not in (select e.vehicle.id from Employee e where e.vehicle.id is not null)")
    public Iterable<Vehicle> findNotUsed();
}
