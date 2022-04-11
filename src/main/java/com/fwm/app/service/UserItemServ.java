package com.fwm.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fwm.app.Repository.UserItemRepo;
import com.fwm.app.vo.HandleItem;
import com.fwm.app.vo.Item;

@Service
public class UserItemServ {

	private UserItemRepo useritemrepo;

	public UserItemServ(UserItemRepo useritemrepo) {
		this.useritemrepo = useritemrepo;
	}

	public List<Item> servGetItems() {
		List<Item> items = useritemrepo.repoGetItems();
		return items;
	}

	public void servSetItem(int category, String name, String firstAttr, String secondAttr, int price,
			String contractDate, String used, int quantity) {

		useritemrepo.repoSetItem(category, name, firstAttr, secondAttr, price, contractDate, used, quantity);


	}

	
	//
	public void servDoitemHandling(int change_id, String change_state, int place, String change_date,
			int change_quantity) {

		useritemrepo.repoDoitemHandling(change_id, change_state, place, change_date, change_quantity);
	}

	public void servDoitemHandlingUpdate(int change_id, String change_state, int change_quantity) {

		useritemrepo.repoDoitemHandlingUpdate(change_id, change_state, change_quantity);
	}

	
	
	
	public List<HandleItem> servItemHistory(int change_id) {
		List<HandleItem> items = useritemrepo.repoItemHistory(change_id);
		return items;
	}

	public void servUpdateItemHistory(int change_historyId, String change_state, int place, String change_date,
			int change_quantity) {
		
		useritemrepo.repoUpdateItemHistory(change_historyId, change_state, place, change_date, change_quantity);
		
	}

	public void servReturnitemHandlingUpdate(int change_id, String original_state, int original_quantity) {
		useritemrepo.repoReturnitemHandlingUpdate(change_id, original_state, original_quantity);
		
	}

	public void servUpdateBasicInfo(int change_id, int category, String name, String firstAttr, String secondAttr, int price,
			String contractDate, String used) {

		useritemrepo.repoUpdateBasicInfo(change_id, category, name, firstAttr, secondAttr, price, contractDate, used);

	}
	
	public void servUpdateBasicQuantity(int change_id, int quantity) {

		useritemrepo.repoUpdateBasicQuantity(change_id, quantity);

	}

}
