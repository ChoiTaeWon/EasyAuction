package com.project.easyauction;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.easyauction.service.MemberService;


@Controller
@RequestMapping(value = "ajax")
public class AjaxController {
	
	private MemberService mbgsvc;
	@Autowired
	@Qualifier(value="memberService")
	public void setMemberService(MemberService mbgsvc){
		this.mbgsvc = mbgsvc;
	}
	
	
	@RequestMapping(value="membercheck.action", method = RequestMethod.GET)
	@ResponseBody //별도의 뷰를 사용하지 말고 return 값을 응답 본문으로 사용하세요
	public int membercheck(String mbId) {
		int result = 0;
		
		result = mbgsvc.getCountByMemberId(mbId);
		
		return result;
	}
}