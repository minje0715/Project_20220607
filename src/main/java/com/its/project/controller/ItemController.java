package com.its.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/item")
public class ItemController {
    @GetMapping("/findAll")
    public String findAll() {
        System.out.println("true = " + true);
        return "itemPage/item";
    }

}
