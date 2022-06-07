package com.its.project.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {
    private Long mid;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberBirth;
    private String memberEmail;
    private String memberPhone;
}
