/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.List;
import model.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import repository.CityRepository;


/**
 *
 * @author Przemek
 */
//
@Service("cityService")
public class CityService {

    @Autowired
    private CityRepository cityRepository;

    public Iterable<City> findAll() {
        return cityRepository.findAll();
    }
}
