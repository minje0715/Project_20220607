package com.its.project.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private Long bid; // 글번호
    private String boardTitle; // 글 제목
    private String boardWriter; // 글작성자
    private String boardContents; // 글내용
    private int boardHits; // 조회수
    private Timestamp boardCreatedTime; // 글작성 시간

}
