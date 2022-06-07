package com.its.project.service;

import com.its.project.dto.MemberDTO;
import com.its.project.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public boolean save(MemberDTO memberDTO) {
       int saveResult = memberRepository.save(memberDTO);
       if(saveResult > 0) {
           return true;
       }else {
           return false;
       }
    }

    public String idCheck(String memberId) {
       String checkResult = memberRepository.idCheck(memberId);
       if(checkResult == null) {
           return "ok";
       }else {
           return "no";
       }
    }

    public MemberDTO login(MemberDTO memberDTO) {
       MemberDTO loginResult = memberRepository.login(memberDTO);
       return loginResult;
    }

    public MemberDTO findById(Long findMember) {
       MemberDTO memberDTO = memberRepository.findById(findMember);
       return memberDTO;
    }

    public List<MemberDTO> findAll() {
       return memberRepository.findAll();
    }

    public boolean update(MemberDTO memberDTO) {
       int updateResult = memberRepository.update(memberDTO);
        System.out.println("updateResult = " + updateResult);
       if(updateResult > 0) {
           return true;
       }else {
           return false;
       }
    }

    public void delete(Long mid) {
        memberRepository.delete(mid);
    }
}
