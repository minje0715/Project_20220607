package com.its.memberboard.service;

import com.its.memberboard.dto.BoardDTO;
import com.its.memberboard.dto.ItemDTO;
import com.its.memberboard.dto.PageDTO;
import com.its.memberboard.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ItemService {
    @Autowired
    private ItemRepository itemRepository;
    public void saveFile(ItemDTO itemDTO) throws IOException {
        MultipartFile itemFile = itemDTO.getItemFile(); // 파일을 꺼낸다
        String itemFileName = itemFile.getOriginalFilename(); // 2.
        itemFileName = System.currentTimeMillis() + "-" + itemFileName;
        String savePath = "C:\\spring_img\\" + itemFileName;
        if (!itemFile.isEmpty()) {
            itemDTO.setItemFileName(itemFileName);
            itemFile.transferTo(new File(savePath));
        }

        itemRepository.saveFile(itemDTO);
    }

    public List<ItemDTO> findAll() {
       return itemRepository.findAll();
    }

    private static final int PAGE_LIMIT = 9;
    // 한 페이지에 보여줄 글 갯수
    private static final int BLOCK_LIMIT = 5;

    /**
     * 요청한 페이지에 해당하는 글 목록을 DB에서 가져오는 역할
     */
    public List<ItemDTO> pagingList(int page) {
        int pagingStart = (page-1) * PAGE_LIMIT;
        Map<String, Integer> pagingParam = new HashMap<>();
        pagingParam.put("start", pagingStart);
        pagingParam.put("limit", PAGE_LIMIT);
        List<ItemDTO> pagingList = itemRepository.pagingList(pagingParam);
        return pagingList;
    }


    public PageDTO paging(int page) {
        int itemCount = itemRepository.itemCount(); // 글 갯수 조회
        // 필요한 전체 페이지 갯수
        int maxPage = (int)(Math.ceil((double)itemCount / PAGE_LIMIT));
        // 시작페이지 1 4 7 10
        int startPage = (((int)(Math.ceil((double)page / BLOCK_LIMIT))) - 1) * BLOCK_LIMIT + 1;
        // 끝페이지 3 6 9 12
        int endPage = startPage + BLOCK_LIMIT - 1;
        if(endPage > maxPage)
            endPage = maxPage;
        PageDTO paging = new PageDTO();
        paging.setPage(page);
        paging.setStartPage(startPage);
        paging.setEndPage(endPage);
        paging.setMaxPage(maxPage);
        return paging;
    }
}
