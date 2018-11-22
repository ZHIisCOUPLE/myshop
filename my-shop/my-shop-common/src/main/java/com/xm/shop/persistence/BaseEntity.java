package com.xm.shop.persistence;


import com.xm.shop.webSupport.Page;
import lombok.Data;

import java.util.Date;

@Data
public abstract class BaseEntity  {


    private Long id;

    private Date created;

    private Date updated;

    private Page page;

    public BaseEntity() {
    }

    public BaseEntity(Long id, Date created, Date updated) {
        this.id = id;
        this.created = created;
        this.updated = updated;
    }

}
