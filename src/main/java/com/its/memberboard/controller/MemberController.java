package com.its.memberboard.controller;

import com.its.memberboard.dto.MemberDTO;
import com.its.memberboard.service.MemberService;
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

    @GetMapping("/save")
    public String saveForm() {
        return "memberPages/save";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        boolean saveResult = memberService.save(memberDTO);
        if (saveResult) {
            return "boardPages/list";
        } else {
            return "memberPages/save-fail";
        }
    }

    @PostMapping("/duplicate-check")
    public @ResponseBody String duplicateCheck(@RequestParam("memberId") String memberId) {
        String checkResult = memberService.duplicateCheck(memberId);
        return checkResult;
    }

    @GetMapping("/login")
    public String loginForm() {
        return "memberPages/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, Model model, HttpSession session) {
        MemberDTO loginMember = memberService.login(memberDTO);
        if (loginMember != null) {
            model.addAttribute("loginMember", loginMember);
            session.setAttribute("loginId", loginMember.getMid());
            session.setAttribute("loginMemberId", loginMember.getMemberId());
            session.setAttribute("loginMemberPassword", loginMember.getMemberPassword());
            return "redirect:/board/list";
        } else {
            return "login-fail";
        }
    }


    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/board/list";
    }

    @GetMapping("/myPage")
    public String findById(HttpSession session, Model model) {
        Long findByMember = (Long) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findById(findByMember);
        model.addAttribute("member", memberDTO);
        return "memberPages/myPage";
    }

    @GetMapping("/updateForm")
    public String updateForm(HttpSession session, Model model) {
        long updateId = (Long) session.getAttribute("loginId");
        MemberDTO memberDTO = memberService.findById(updateId);
        model.addAttribute("updateMember", memberDTO);
        return "memberPages/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        System.out.println("controller memberDTO = " + memberDTO);
        boolean updateResult = memberService.update(memberDTO);
        if (updateResult) {
            return "redirect:/member/myPage";
        } else {
            return "update-fail";
        }
    }
    @GetMapping ("/memberList")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "memberPages/findAll";
    }
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long mid){
        memberService.delete(mid);
        return "redirect:/member/memberList";
    }

}


