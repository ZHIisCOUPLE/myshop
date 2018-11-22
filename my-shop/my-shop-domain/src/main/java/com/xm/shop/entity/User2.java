package com.xm.shop.entity;

import com.xm.shop.persistence.BaseEntity;
import lombok.Data;

@Data
public class User2 extends BaseEntity {
    private String userName;
    private String password;
    private String email;
    private String phone;
}
