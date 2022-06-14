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
//    @GetMapping ("/buyItem")
//    public String buyItem(@RequestParam("id") Long pid,
//                            @RequestParam("mid") Long mid) {
//        MemberDTO buyMember = memberService.findById(mid);
//            System.out.println("buyMember = " + buyMember);
//        Long itemResult = itemService.findById(pid).getItemPrice();
//        if(buyMember.getMemberCash() > itemService.findById(pid).getItemPrice()) {
//            itemService.delete(pid);
//            buyMember.setItemPrice(itemResult);
//            memberService.cashUpdate(buyMember);
//
//            return "redirect:/item/findAll";
//        }else {
//            return "buy-fail";
//        }
//    }

    @GetMapping ("/buyItem")
    public String buyItem(@RequestParam("id") Long pid,
                            @RequestParam("mid") Long mid, @RequestParam("memberId") String memberId) {
        MemberDTO buyMember = memberService.findById(mid); // 구매자 아이디값 조회
            System.out.println("buyMember = " + buyMember);
        System.out.println("pid = " + pid + ", mid = " + mid + ", memberId = " + memberId);
            MemberDTO sellMember = memberService.findByMemberId(memberId); // 판매자 아이디값 조회
        System.out.println("sellMember = " + sellMember);

        Long itemResult = itemService.findById(pid).getItemPrice();
        if(buyMember.getMemberCash() > itemService.findById(pid).getItemPrice()) {
            itemService.delete(pid); // 판매된 아이템 리스트에서 삭제

            sellMember.setItemPrice(itemResult); // 판매된 아이템 가격 set
            System.out.println("itemResult = " + itemResult);
            memberService.sellMemberCashUpdate(sellMember); // 판매한 아이템 가격 업데이트
            System.out.println(sellMember);

            buyMember.setItemPrice(itemResult); // 구매한 아이템 가격 구매자 돈에서 차감
            memberService.cashUpdate(buyMember); // 구매후 돈 업데이트

            return "redirect:/item/findAll";
        }else {
            return "buy-fail";
        }
    }
}
