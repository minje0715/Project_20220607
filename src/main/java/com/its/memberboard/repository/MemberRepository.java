package com.its.memberboard.repository;

import com.its.memberboard.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Member;
import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        return sql.insert("Member.save", memberDTO);
    }

    public String duplicateCheck(String memberId) {
        return sql.selectOne("Member.duplicateCheck", memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }

    public MemberDTO findById(Long findByMember) {
        return sql.selectOne("Member.findById", findByMember);
    }

    public int update(MemberDTO memberDTO) {
        System.out.println("RmemberDTO = " + memberDTO);
        return sql.update("Member.update", memberDTO);
    }

    public List<MemberDTO> findAll() {
       return sql.selectList("Member.findAll");
    }

    public void delete(Long mid) {
        sql.delete("Member.delete", mid);
    }

    public void cash(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        sql.update("Member.cash", memberDTO);
    }
}