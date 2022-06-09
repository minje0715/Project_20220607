package com.its.memberboard.repository;

import com.its.memberboard.dto.ItemDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public void saveFile(ItemDTO itemDTO) {
        System.out.println("rritemDTO = " + itemDTO);
        sql.insert("Item.save", itemDTO);
    }

    public List<ItemDTO> findAll() {
       return sql.selectList("Item.findAll");
    }
}
