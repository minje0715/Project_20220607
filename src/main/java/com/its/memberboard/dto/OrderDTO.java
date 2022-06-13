package com.its.memberboard.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDTO {
    private Long oid;
    private Long sid;
    private Long mid;
    private int trade;
    private Timestamp tradeCreatedTime;
}
//    oid bigint auto_increment primary key, -- 거래번호
//    sid bigint not null, -- 상품 참조
//    mid bigint not null, -- 회원아이디 참조
//    trade int not null default 0, -- 구매판매
//-- 판매가 0 이라는 가정하에 디폴트 0을 줌
//    tradeCreatedTime datetime,
