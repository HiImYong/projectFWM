package com.fwm.app.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class HandleItem {
	
	private int id;
	private String change_state;
	private int place;
	private String change_date;
	private int change_quantity;
	private int change_id;
	private int price;
	private String name;
	private String placeName;

	

}
