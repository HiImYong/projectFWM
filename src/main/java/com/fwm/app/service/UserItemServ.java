package com.fwm.app.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.fwm.app.Repository.UserItemRepo;
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

	public List<Item> servSetItem(int category, String name, String firstAttr, String secondAttr, int price,
			String contractDate, String used, int quantity) {

		useritemrepo.repoSetItem(category, name, firstAttr, secondAttr, price, contractDate, used, quantity);

		return null;

	}

	public void servDoitemHandling(int change_id, int change_state, int place, String change_date, int change_quantity) {

		useritemrepo.repoDoitemHandling(change_id, change_state, place, change_date, change_quantity);
	}
	
	public void servDoitemHandlingUpdate(int change_id, int change_state, int change_quantity) {

		useritemrepo.repoDoitemHandlingUpdate(change_id, change_state, change_quantity);
	}

}
