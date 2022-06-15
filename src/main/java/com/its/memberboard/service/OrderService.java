package com.its.memberboard.service;

import com.its.memberboard.dto.OrderDTO;
import com.its.memberboard.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;

    public void save(OrderDTO newOrderDTO) {
        orderRepository.save(newOrderDTO);
    }

    public List<OrderDTO> findAll() {
       return orderRepository.findAll();
    }
}
