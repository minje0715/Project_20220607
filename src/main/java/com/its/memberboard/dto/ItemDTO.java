package com.its.memberboard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class ItemDTO {
    private Long pid;
    private String memberId; // 판매자
    private String itemName;
    private String itemPrice;
    private Timestamp itemCreatedTime; // 상품올린시간
    private String itemFileName; // 사진 이름
    private MultipartFile itemFile; // 사진저장
}
