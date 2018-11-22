import com.alibaba.fastjson.JSON;
import com.xm.shop.service.Api_SlideShowService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-context.xml"})
public class testSlideShow {

    @Autowired
    private Api_SlideShowService apiSlideShowService;

    @Test
    public void t1(){
        List<String> slideShow = apiSlideShowService.getSlideShow();
        String s = JSON.toJSONString(slideShow);
        System.out.println(s);
    }
}
