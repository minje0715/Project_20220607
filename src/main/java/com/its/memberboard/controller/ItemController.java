package com.its.memberboard.controller;

import com.its.memberboard.dto.ItemDTO;
import com.its.memberboard.dto.MemberDTO;
import com.its.memberboard.dto.PageDTO;
import com.its.memberboard.service.ItemService;
import com.its.memberboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {
    @Autowired
    private ItemService itemService;
    @Autowired
    private MemberService memberService;



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
    @GetMapping ("/buyItem")
    public String buyItem(@RequestParam("id") Long pid,
                            @RequestParam("mid") Long mid) {
        MemberDTO buyMember = memberService.findById(mid);
            System.out.println("buyMember = " + buyMember);
        if(buyMember.getMemberCash() > itemService.findById(pid).getItemPrice()) {
            itemService.delete(pid);
            memberService.cashUpdate(buyMember);
            return "index";
        }else {
            return "buy-fail";
        }
    }
}
