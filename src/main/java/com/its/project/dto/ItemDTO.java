package com.its.project.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ItemDTO {
    private Long pid;
    private String itemName; // 상품이름
    private String itemPrice; // 상품가격
    private MultipartFile itemFile; //상품저장
    private String itemFileName; //상품사진
}
