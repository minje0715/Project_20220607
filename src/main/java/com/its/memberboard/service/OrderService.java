package com.its.memberboard.service;

import com.its.memberboard.dto.OrderDTO;
import com.its.memberboard.dto.PageDTO;
import com.its.memberboard.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


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


    private static final int PAGE_LIMIT = 10;
    // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 3;

    public PageDTO paging(int page) {
        int tradeCount = orderRepository.tradeCount(); // 글 갯수 조회
        // 필요한 전체 페이지 갯수
        int maxPage = (int) (Math.ceil((double) tradeCount / PAGE_LIMIT));
        // 시작페이지 1 4 7 10
        int startPage = (((int) (Math.ceil((double) page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12
        int endPage = startPage + BLOCK_LIMIT - 1;
        if (endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }

    public List<OrderDTO> pagingList(int page) {
        int pagingStart = (page - 1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<OrderDTO> pagingList = orderRepository.pagingList(pagingParam);
        return pagingList;
    }
}



