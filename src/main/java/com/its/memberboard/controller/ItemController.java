package com.its.memberboard.controller;

import com.its.memberboard.dto.ItemDTO;
import com.its.memberboard.dto.PageDTO;
import com.its.memberboard.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/save") // 아이템 등록
    public String saveFile(@ModelAttribute ItemDTO itemDTO) throws IOException {
        System.out.println("ccitemDTO = " + itemDTO);
    itemService.saveFile(itemDTO);
    return "redirect:/item/findAll";
    }


    @GetMapping("/findAll") // 판매등록 아이템 전체목록
    public String findAll(Model model,@RequestParam(value="page", required = false,
            defaultValue = "1") int page) {
        List<ItemDTO> itemDTOList = itemService.pagingList(page);
        PageDTO paging = itemService.paging(page);
        model.addAttribute("itemList", itemDTOList);
        model.addAttribute("paging", paging);
        return "itemPages/findAll";
    }
//    @GetMapping ("/buyItem")
//    public String buyItem() {
//
//    }
}
