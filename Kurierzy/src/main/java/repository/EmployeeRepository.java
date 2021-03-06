/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import javax.transaction.Transactional;
import model.Employee;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Przemek
 */
@Repository 
@Transactional
public interface EmployeeRepository extends CrudRepository<Employee,Integer> {
    
    
//    @Query("Select c from Client c where c.email like :email")
//    public Role findRoleById(@Param("email")String name);
    @Query("Select e from Employee e where e.email like :email")
    public Employee findBeEmail(@Param("email")String email);
    
    @Query(value = "Select * from employee e, role r where r.id in (select er.role_id from employee_role er where er.employee_id = e.id ) and r.title like :title" , nativeQuery = true)
    public Iterable<Employee> findAllByRole(@Param("title")String title);
}
