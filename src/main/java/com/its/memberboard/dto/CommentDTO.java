package com.its.memberboard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class CommentDTO {
    private Long cid;
    private Long bid;
    private String commentWriter;
    private String commentContents;
    private Timestamp commentCreatedTime;
}
