package com.its.memberboard.repository;

import com.its.memberboard.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(BoardDTO boardDTO) {
       return sql.insert("Board.save", boardDTO);
    }


    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }
    public BoardDTO findById(Long bid) {
        return sql.selectOne("Board.findById", bid);
    }

    public void update(BoardDTO boardDTO) {
        System.out.println("Repository boardDTO = " + boardDTO);
        sql.update("Board.update", boardDTO);
    }

    public void delete(Long bid) {
        sql.delete("Board.delete", bid);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Board.pagingList", pagingParam);
    }

    public List<BoardDTO> search(Map<String, String> searchParam) {
        return sql.selectList("Board.search", searchParam);
    }
}