package com.its.memberboard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDTO {
    private Long oid;
    private int trade;
    private String itemName;
    private String memberId;
    private Long itemPrice;
    private Timestamp itemCreatedTime;
}