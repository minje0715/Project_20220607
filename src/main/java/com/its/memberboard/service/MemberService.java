package com.its.memberboard.service;

import com.its.memberboard.dto.MemberDTO;
import com.its.memberboard.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;

    public boolean save(MemberDTO memberDTO) {
        int saveResult = memberRepository.save(memberDTO);
        if (saveResult > 0) {
            return true;
        } else {
            return false;
        }
    }
    public String duplicateCheck(String memberId) {
        String checkResult = memberRepository.duplicateCheck(memberId);
        if (checkResult == null) {
            return "ok";
        } else {
            return "no";
        }
    }

    public MemberDTO login(MemberDTO memberDTO) {
       MemberDTO loginMember = memberRepository.login(memberDTO);
       return loginMember;
    }

    public MemberDTO findById(Long findByMember) {
       MemberDTO memberDTO = memberRepository.findById(findByMember);
       return memberDTO;
    }

    public boolean update(MemberDTO memberDTO) {
        System.out.println("SmemberDTO = " + memberDTO);
       int updateResult = memberRepository.update(memberDTO);
       if(updateResult > 0) {
           return true;
       }else {
           return false;
       }
    }

    public List<MemberDTO> findAll() {
       return memberRepository.findAll();
    }

    public void delete(Long mid) {
        memberRepository.delete(mid);
    }

    public boolean updateCash(MemberDTO memberDTO) {
        System.out.println("ssmemberDTO = " + memberDTO);
       int updateResult = memberRepository.updateCash(memberDTO);
       if(updateResult > 0) {
           return true;
       }else {
           return false;
       }
    }

    public void cashUpdate(MemberDTO buyMember) {
        memberRepository.cashUpdate(buyMember);
    }
}