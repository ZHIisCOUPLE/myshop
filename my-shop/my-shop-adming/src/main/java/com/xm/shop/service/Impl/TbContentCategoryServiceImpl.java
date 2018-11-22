package com.xm.shop.service.Impl;

import com.xm.shop.dao.TbContentCategoryDao;
import com.xm.shop.entity.TbContentCategory;
import com.xm.shop.persistence.BaseServiceImpl;
import com.xm.shop.persistence.Result;
import com.xm.shop.service.TbContentCategoryService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TbContentCategoryServiceImpl extends BaseServiceImpl<TbContentCategory, TbContentCategoryDao> implements TbContentCategoryService {

    /**
     * 通过ID来查找到它下面的子节点的数组
     * @param id
     * @return
     */
    @Override
    public List<TbContentCategory> getChildrenCategory(Long id) {
        return dao.getChildrenCategory(id);
    }


    /**
     * 查询树表
     * @return
     */
    @Override
    public List<TbContentCategory> queryTreeTable() {
        List<TbContentCategory> list=dao.queryTreeTable();
        //先把最顶这条取出来
        TbContentCategory root=null;
        for(TbContentCategory category:list){
            if(category.getParent().getId().longValue()==0){
                root=category;
            }
        }
        //执行递归操作
        //先拿一条记录出来,再遍历整个列表，当发现遍历的记录的父id正好是这个记录的id
        //应该把正在遍历的这条记录放到这个记录的下一个位置

        List<TbContentCategory> target=addCategory(list,root);
        return target;
    }

    /**
     * 先把category放到target里面去，再将父节点是category的子节点放到target这个list返回
     * @param source
     * @param category
     * @return
     */
    private List<TbContentCategory> addCategory(List<TbContentCategory> source,TbContentCategory category){
        List<TbContentCategory> target=new ArrayList<>();
        target.add(category);
        for(TbContentCategory c:source){
            if(c.getParent().getId().longValue()==category.getId().longValue()){
                List<TbContentCategory> categories=addCategory(source,c);
                target.addAll(categories);
            }
        }
        return target;
    }



    @Override
    public Result save(TbContentCategory category) {
        if (category.getParent().getId()!=null && category.getParent().getId()>0){
            //判断修改拿到的父ID是不是本身
            if ( category.getParent().getId()!=category.getId()){
                category.getParent().setId(30L);
            }else {
                dao.setIsParentTrue(category.getParent().getId());
            }
        }
        return super.save(category);
    }

    @Override
    public Result update(TbContentCategory category) {
        //判断是否有父类
        if (category.getParent().getId()!=null && category.getParent().getId().longValue()>0){
            //判断修改拿到的父ID是不是本身
            if (category.getParent().getId()== category.getId()){
                category.getParent().setId(30L);
            }else {
                //拿到所有
                TbContentCategory contentCategory = new TbContentCategory();
                Result result = findList(contentCategory);
                List<TbContentCategory> list = (List<TbContentCategory>)result.getData();

                //判断该类上是否含有父类 有则并把父类的IsParent设置为1
                for (TbContentCategory tbContentCategory:list) {
                    if (tbContentCategory.getId()==category.getParent().getId()){
                        tbContentCategory.setIsParent(1);
                    }
                }
           //查看所有的类下是否含有子类   没有则把IsParent设置为0
                for(int i=0;i<list.size();i++){
                    TbContentCategory category1 = list.get(i);
                    A:for(int j=0;j<list.size();j++){
                        TbContentCategory category2 = list.get(j);
                        if (category1.getId()==category2.getParent().getId()){
                            dao.setIsParentTrue(category1.getId());
                            break A;
                        }else {
                            dao.setIsParentFalse(category1.getId());
                        }
                    }
                }

            }
            //拿到所有
            TbContentCategory contentCategory = new TbContentCategory();
            Result result = findList(contentCategory);
            List<TbContentCategory> list = (List<TbContentCategory>)result.getData();
       //判断该类下是否含有子类
            for (TbContentCategory tbContentCategory:list) {
                if (tbContentCategory.getParent().getId()==category.getId()){
                    dao.setParentId(tbContentCategory.getId());
                }
            }
        }
        return super.update(category);
    }

    @Override
    public Result pageList(TbContentCategory category) {
        //拿到所有
        TbContentCategory contentCategory = new TbContentCategory();
        Result result = findList(contentCategory);
        List<TbContentCategory> list = (List<TbContentCategory>)result.getData();
        //查看所有的类下是否含有子类   没有则把IsParent设置为0
        for(int i=0;i<list.size();i++){
            TbContentCategory category1 = list.get(i);
            A:for(int j=0;j<list.size();j++){
                TbContentCategory category2 = list.get(j);
                if (category1.getId()==category2.getParent().getId()){
                    dao.setIsParentTrue(category1.getId());
                    break A;
                }else {
                    dao.setIsParentFalse(category1.getId());
                }
            }
        }
        return super.pageList(category);
    }

    @Override
    public Result delete(Long id) {
        TbContentCategory category = dao.getByid(id);

        if (category.getIsParent()==1){
            return Result.fail("该类下有子类，不能删除！");
        }
        return super.delete(id);
    }
}
