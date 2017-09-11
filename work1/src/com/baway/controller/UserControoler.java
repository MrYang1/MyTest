package com.baway.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.baway.dao.UserMapper;
import com.baway.pojo.User;

@Controller
@RequestMapping("user")
public class UserControoler {

	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("register")
	public String Stringregister(MultipartFile source, User user) throws Exception{
		
		//判断文件是否存在
		File file=new File("D:/apache-tomcat-7.0.75/webapps/img");
		boolean b=file.isFile();
		//如果文件不存在返回false
		if (b==false) {
			file.mkdirs();
		}
		
		String realPath="D:/apache-tomcat-7.0.75/webapps/img/";
		String fileName=source.getOriginalFilename();
		String path=realPath+fileName;
		source.transferTo(new File(path));
		String photo="../../img/"+fileName;
		
		user.setPhotourl(photo);
		userMapper.addUser(user);
		System.out.println(user);
		return "redirect:/user/selectUser";
	}
	
	@RequestMapping("selectUser")
	public String selectUser(HttpSession session){
		List<User> list=new ArrayList<User>();
		list=userMapper.selectUser();
		session.setAttribute("list", list);
		System.out.println(list);
		return "index";
	}
	
}
