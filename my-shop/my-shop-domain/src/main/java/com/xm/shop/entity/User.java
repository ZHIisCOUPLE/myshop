package com.xm.shop.entity;

import com.xm.shop.persistence.BaseEntity;
import com.xm.shop.utils.PattenUtil;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Pattern;
import java.io.Serializable;

@Data
public class User extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 838491375185727006L;


    @Length( max = 10,min = 3, message = "用户名不能少于3位且不能多与10位！")
    private String userName;
    @Length(max = 18,min = 6,message = "密码长度必须介于6到18位之间！")
    private String password;

    @Pattern(regexp = PattenUtil.PHONE_PATTEN,message = "电话号码格式不对！")
    private String phone;

    @Pattern(regexp = PattenUtil.EMAIL_PATTEN,message = "邮箱格式不对！")
    private String email;


    public User() {
    }

    public User( String userName, String password, String phone, String email) {

        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.email = email;

    }

}
