package com.its.memberboard.controller;

import com.its.memberboard.dto.ItemDTO;
import com.its.memberboard.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    private ItemService itemService;
    @GetMapping("/index")
    public String index() {
        return "itemPages/index";
    }

    @GetMapping("/itemSave") //판매창으로 이동
    public String saveForm() {
        return "itemPages/saveForm";
    }

    @GetMapping("/save")
    public String save() {
        return "itemPages/save";
    }

    @PostMapping("/save")
    public String saveFile(@ModelAttribute ItemDTO itemDTO) throws IOException {
        System.out.println("ccitemDTO = " + itemDTO);
    itemService.saveFile(itemDTO);
    return "redirect:/item/findAll";
    }

    @GetMapping ("/findAll")
    public String findAll(Model model) {
        List<ItemDTO> itemDTOList = itemService.findAll();
        model.addAttribute("itemList", itemDTOList);
        return "itemPages/findAll";
    }
}
