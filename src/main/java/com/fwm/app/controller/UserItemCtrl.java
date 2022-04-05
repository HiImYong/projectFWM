package com.fwm.app.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fwm.app.service.UserItemServ;
import com.fwm.app.vo.Item;
import com.fwm.app.vo.HandleItem;

@Controller
public class UserItemCtrl {

	private UserItemServ useritemserv;

	public UserItemCtrl(UserItemServ useritemserv) {
		this.useritemserv = useritemserv;
	}

	@RequestMapping("/user/item/main")
	public String showMain(Model model) {

		List<Item> items = useritemserv.servGetItems();

		model.addAttribute("items", items);

		return "/user/item/main";
	}

	@RequestMapping("/user/item/doSetItem")
	@ResponseBody
	public String doSetItem(int category, String name, String firstAttr, String secondAttr, int price,
			String contractDate, String used, int quantity) {

		useritemserv.servSetItem(category, name, firstAttr, secondAttr, price, contractDate, used, quantity);

		return """
				<script>
				alert("신규 자재가 등록되었습니다.");
				location.replace('/user/item/main');
				</script>
				""";
	}

	@RequestMapping("/user/item/itemHandling")
	public String showhandleItem(Model model) {

		List<Item> items = useritemserv.servGetItems();

		model.addAttribute("items", items);

		return "/user/item/itemHandling";
	}

	@RequestMapping("/user/item/doitemHandling")
	@ResponseBody
	public String doitemHandling(int change_id, String change_state, int place, String change_date,
			int change_quantity) {

		useritemserv.servDoitemHandling(change_id, change_state, place, change_date, change_quantity);
		useritemserv.servDoitemHandlingUpdate(change_id, change_state, change_quantity);

		return """
				<script>
				alert("자재 수량이 변경되었습니다.");
				location.replace('/user/item/itemHandling');
				</script>
				""";

	}

// 자재 변경 이력 보기
	@RequestMapping("/user/item/itemHistory")
	public String itemHistory(Model model, int change_id) {

		List<HandleItem> items = useritemserv.servItemHistory(change_id);

		model.addAttribute("items", items);

		return "/user/item/itemHistory";
	}

// 자재 변경 이력 수정
	@RequestMapping("/user/item/updateItemHistory")
	@ResponseBody
	public String updateItemHistory(int change_id, int original_quantity, int change_historyId, String change_state,
			String original_state, int place, String change_date, int change_quantity) {

		useritemserv.servReturnitemHandlingUpdate(change_id, original_state, original_quantity);
		useritemserv.servUpdateItemHistory(change_historyId, change_state, place, change_date, change_quantity);
		useritemserv.servDoitemHandlingUpdate(change_id, change_state, change_quantity);

		return """
				<script>
				alert("자재 수량이 변경되었습니다.");
				location.replace('/user/item/itemHandling');
				</script>
				""";
	}
	
	



}

