package com.xm.shop.persistence;

import com.xm.shop.webSupport.PageResult;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public abstract class BaseServiceImpl<T extends BaseEntity,D extends BaseDao> implements BaseService<T> {
    /**
     * dao
     */
    @Autowired
    protected D dao;

    private static final Logger logger= Logger.getLogger(BaseServiceImpl.class);


    @Override
    @Transactional
    public Result save(T t) {

        try {
            Date date = new Date();
            t.setCreated(date);
            t.setUpdated(date);


            dao.save(t);
            return Result.success("",t);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    @Override
    @Transactional
    public Result delete(Long id) {
        try {
            dao.delete(id);
            return Result.success("",id);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    @Override
    @Transactional
    public Result update(T t) {
        try {
            Date date = new Date();
            t.setUpdated(date);

            dao.update(t);
            return Result.success("",t);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    @Override
    public Result findList(T t) {
        try {
            List<T> list=dao.findList(t);
            return Result.success("",list);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
            return Result.fail(e.getMessage());
        }
    }

    /**分页查询
     *
     * @param t
     * @return
     */
    @Override
    public Result pageList(T t) {

        //得到总条数
        Long count = dao.findListCount(t);

        //得到查找到的数据
        List<T> userList = dao.findList(t);

        Result result = getResult(t, count, userList);


        return result;
    }


    protected Result getResult(T  t, long count, List<T> userList) {
        PageResult<T> pageResult=new PageResult<>();
        pageResult.setCount(count);
        pageResult.setPageSize(t.getPage().getPageSize());
        pageResult.setCurrent(t.getPage().getCurrent());
        pageResult.setList(userList);
        Result result=new Result();
        result.setData(pageResult);
        return result;
    }

    /**
     * 根据id查找到数据
     * @param id
     * @return
     */
    @Override
    public T getByid(Long id) {
        T t = (T) dao.getByid(id);
        return t;
    }
}
