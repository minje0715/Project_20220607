package com.its.memberboard.service;

import com.its.memberboard.dto.ItemDTO;
import com.its.memberboard.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

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
}
