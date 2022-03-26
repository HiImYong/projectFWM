package com.fwm.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Item {
	
	private int id;
	private int category;
	private String name;
	private String firstAttr;
	private String secondAttr;
	private int price;
	private String contractDate;
	private String used;
	private int quantity;
	

}
