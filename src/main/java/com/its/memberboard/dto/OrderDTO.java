package com.its.memberboard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDTO {
    private Long oid;
    private Long sid;
    private Long mid;
    private int trade;
    private Long itemPrice;
    private Timestamp tradeCreatedTime;
}