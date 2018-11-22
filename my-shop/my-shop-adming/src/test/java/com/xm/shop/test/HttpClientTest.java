package com.xm.shop.test;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.junit.Test;


import java.util.ArrayList;
import java.util.List;


public class HttpClientTest {

    @Test
    public void testGet(){

        try {
            //创建一个httpclient
            HttpClient httpClient = HttpClients.createDefault();
            //创建一个httpResponse对象（用来获取响应结果）
            HttpResponse httpResponse=null;

            //创建一个httpGet对象
            HttpGet httpGet=new HttpGet("https://www.baidu.com/");
//到该网页找到Request Headers  拿到  User-Agent  和它的值
            //设置头
            httpGet.setHeader("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36");

            //执行访问
            httpResponse = httpClient.execute(httpGet);
//获取响应结果
            HttpEntity httpEntity = httpResponse.getEntity();
//将结果转成String对象
            String s = EntityUtils.toString(httpEntity);

            System.out.println(s);


        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Test
    public void testPost(){
        try {
            //创建httpClient对象
            HttpClient httpClient = HttpClients.createDefault();
            //创建httpResponse对象
            HttpResponse httpResponse = null;
            //获得httpposet对象
            HttpPost httpPost =new HttpPost("http://localhost:8080/user/add");
            //设置头
            httpPost.setHeader("User-Agent","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36");

            //设置额外参数
            BasicNameValuePair userName = new BasicNameValuePair("userName", "zzzzz");
            BasicNameValuePair password = new BasicNameValuePair("password", "123565432");
            BasicNameValuePair phone = new BasicNameValuePair("phone", "15223548946");
            BasicNameValuePair email = new BasicNameValuePair("email", "153546@qq.com");
//将参数存到集合
            List<BasicNameValuePair> list = new ArrayList<>();

            list.add(userName);
            list.add(password);
            list.add(phone);
            list.add(email);

            //设置参数到httpPost对象中
            httpPost.setEntity(new UrlEncodedFormEntity(list,"utf-8"));
            //执行访问
            httpResponse = httpClient.execute(httpPost);
            //获得响应结果
            HttpEntity httpEntity = httpResponse.getEntity();
            //把结果转成String对象
            String s = EntityUtils.toString(httpEntity);
            System.out.println(s);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
