package com.its.memberboard.repository;

import com.its.memberboard.dto.ItemDTO;
import com.its.memberboard.dto.OrderDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void save(OrderDTO newOrderDTO) {
        sql.insert("Order.save", newOrderDTO);
    }

    public List<OrderDTO> findAll() {
       return sql.selectList("Order.findAll");
    }

    public int tradeCount() {
        return sql.selectOne("Order.count");
    }

    public List<OrderDTO> pagingList(Map<String, Integer> pagingParam) {
        return sql.selectList("Order.pagingList", pagingParam);
    }

}
