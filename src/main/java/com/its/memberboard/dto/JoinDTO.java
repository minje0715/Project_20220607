package com.its.memberboard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
public class JoinDTO {
    private Long mid; // 회원번호
    private String memberId; //아이디
    private String memberPassword; //비밀번호
    private String memberName; //이름
    private String memberBirth; //생년월일
    private String memberEmail; //이메일
    private String memberPhone; //핸드폰
    private Long memberCash; // 캐쉬

    private Long pid; // 상품번호
    private Long itemPrice; // 아이템 가격
    private String itemName;
    private Timestamp itemCreatedTime; // 상품올린시간
    private String itemFileName; // 사진 이름
    private MultipartFile itemFile; // 사진저장

    private Long oid; // 거래번호
    private int trade; // 구매 인지 판매인지 나타내는 필드값
    private Timestamp tradeCreatedTime; // 거래 완료 시간
}
