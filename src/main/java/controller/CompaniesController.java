package controller;

import entity.Companies;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import repository.CompaniesRepository;

import java.util.List;

@RestController
@RequestMapping("/companies")
public class CompaniesController {

    @Autowired
    CompaniesRepository companiesRepository;

    @GetMapping
    public List<Companies> getall() {
        return companiesRepository.findAll();
    }
}
