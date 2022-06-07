package com.its.project.controller;

import com.its.project.dto.MemberDTO;
import com.its.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping ("/save")
    public String saveForm() {
        return "memberPages/save";
    }

    @PostMapping ("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
       boolean saveResult = memberService.save(memberDTO);
       if(saveResult) {
           return "memberPages/login";
       }else {
           return "save-fail";
       }
    }
    @PostMapping ("/duplicateCheck")
    public @ResponseBody String idCheck(@RequestParam("memberId")String memberId) {
       String checkResult = memberService.idCheck(memberId);
       return checkResult;
    }
    @GetMapping ("/login")
    public String loginForm() {
        return "memberPages/login";
    }
    @PostMapping ("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
      MemberDTO loginResult = memberService.login(memberDTO);
      if(loginResult != null) {
        model.addAttribute("loginMember",loginResult);
        session.setAttribute("loginId",loginResult.getMid());
        session.setAttribute("loginMemberId",loginResult.getMemberId());
        return "index";
      }else{
          return "login-fail";
      }
    }
    @GetMapping ("/detail")
    public String findById(HttpSession session, Model model) {
       Long findMember = (Long)session.getAttribute("loginId");
       MemberDTO memberDTO = memberService.findById(findMember);
       model.addAttribute("member", memberDTO);
       return "memberPages/findById";
    }
    @GetMapping ("/findAll")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "memberPages/findAll";
    }
    @GetMapping ("/update")
    public String updateForm(HttpSession session, Model model) {
       Long updateId = (Long) session.getAttribute("loginId");
       MemberDTO memberDTO = memberService.findById(updateId);
       model.addAttribute("updateMember", memberDTO);
       return "memberPages/update";
    }
    @PostMapping ("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
       boolean updateResult = memberService.update(memberDTO);
       if(updateResult) {
           return "redirect:/member/detail";
       }else {
           return "update-fail";
       }
    }
    @GetMapping ("/delete")
    public String delete(@RequestParam("id") Long mid ) {
        memberService.delete(mid);
        return "redirect:/member/detail";
    }
}
