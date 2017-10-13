package com.th.controller;

import com.th.model.Group;
import com.th.model.MemberShip;
import com.th.model.User;
import com.th.service.MemberShipService;
import com.th.util.ResponseUtil;
import com.th.util.StringUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/memberShip")
public class MenberShipController {
	@Resource
	private MemberShipService memberShipService;

	@RequestMapping("/updateMemberShip")
	public String updateMemberShip(HttpServletResponse response, String userId, String groupsIds) throws Exception{
		//刪除全部角色
		memberShipService.deleteAllGroupsByUserId(userId);

		if(StringUtil.isNotEmpty(groupsIds)){
			//分割字符串，以，分割
			String idsArr[]=groupsIds.split(",");
			for(String groupId:idsArr){
				User user=new User();
				user.setId(userId);
				Group group=new Group();
				group.setId(groupId);
				MemberShip memberShip=new MemberShip();
				memberShip.setUser(user);
				memberShip.setGroup(group);
				memberShipService.addMemberShip(memberShip);
			}
		}
		JSONObject result=new JSONObject();
		result.put("success", true);
		ResponseUtil.write(response, result);
		return null;
	}
}
