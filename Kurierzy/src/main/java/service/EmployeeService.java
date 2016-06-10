/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import javax.transaction.Transactional;
import model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repository.EmployeeRepository;

/**
 *
 * @author Przemek
 */

@Service 
@Transactional
public class EmployeeService {
    
    @Autowired
    EmployeeRepository employeeRepository;
    
    public void save(Employee employee){
        employeeRepository.save(employee);
    }
    
    public Iterable<Employee> findAll(){
        return employeeRepository.findAll();
    }
    
    public Employee findOne(Integer id){
        return employeeRepository.findOne(id);
    }
    
    public void delete(Integer id){
        employeeRepository.delete(id);
    }
}
