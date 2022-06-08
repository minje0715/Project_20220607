package com.its.memberboard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDTO {
    private int bid;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private int boardHits;
    private Timestamp boardCreatedTime;
}
