package com.its.memberboard.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class MemberDTO {
    private Long mid; // 회원번호
    private String memberId; //아이디
    private String memberPassword; //비밀번호
    private String memberName; //이름
    private String memberBirth; //생년월일
    private String memberEmail; //이메일
    private String memberPhone; //핸드폰
    private Long memberCash; // 캐쉬
    private Long itemPrice; // 아이템 가격
}
