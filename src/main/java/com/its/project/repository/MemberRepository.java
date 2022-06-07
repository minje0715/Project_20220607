package com.its.project.repository;

import com.its.project.dto.MemberDTO;
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

    public String idCheck(String memberId) {
       return sql.selectOne("Member.idCheck", memberId);
    }

    public MemberDTO login(MemberDTO memberDTO) {
       return sql.selectOne("Member.login", memberDTO);
    }

    public MemberDTO findById(Long findMember) {
       return sql.selectOne("Member.findById", findMember);
    }

    public List<MemberDTO> findAll() {
       return sql.selectList("Member.findAll");
    }

    public int update(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
       return sql.update("Member.update", memberDTO);
    }

    public void delete(Long mid) {
        sql.delete("Member.delete", mid);
    }
}
