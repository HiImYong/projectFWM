package com.fwm.app.Repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.fwm.app.vo.HandleItem;
import com.fwm.app.vo.Item;

@Mapper
public interface UserItemRepo {

	@Select("select * from item")
	public List<Item> repoGetItems();

	@Insert("""
			INSERT INTO item SET
			category = #{category},
			name = #{name},
			firstAttr = #{firstAttr},
			secondAttr = #{secondAttr},
			price = #{price},
			contractDate = #{contractDate},
			used = #{used},
			quantity = #{quantity}

			""")
	public void repoSetItem(int category, String name, String firstAttr, String secondAttr, int price,
			String contractDate, String used, int quantity);

	@Insert("""
			INSERT INTO HandleItem SET
			change_state = #{change_state},
			place = #{place},
			change_date = #{change_date},
			change_quantity = #{change_quantity},
			change_id = #{change_id};
			""")
	public void repoDoitemHandling(int change_id, String change_state, int place, String change_date, int change_quantity);

	@Update("""
			UPDATE Item
			SET 
			quantity = quantity + IF(#{change_state}="출고",#{change_quantity}*-1,#{change_quantity})
			WHERE 
			id = #{change_id};
			""")
	public void repoDoitemHandlingUpdate(int change_id, String change_state, int change_quantity);

	@Select("""
			SELECT hdi.id, hdi.change_id, i.name, pc.placeName, hdi.change_state, change_quantity, hdi.change_date, i.price
			FROM HandleItem AS hdi
			INNER JOIN Item AS i
			ON hdi.change_id = i.id
			INNER JOIN PlaceCategory AS pc
			ON hdi.place = pc.id
			WHERE
			hdi.change_id = #{change_id};
			""")
	public List<HandleItem> repoItemHistory(int change_id);
	
		
	@Update("""
			UPDATE HandleItem
			SET 
			change_state = #{change_state},
			place = #{place},
			change_date = #{change_date},
			change_quantity = #{change_quantity}
			WHERE
			id = #{change_historyId};			
			""")
	public void repoUpdateItemHistory(int change_historyId, String change_state, int place, String change_date,
			int change_quantity);
	
	
	
	@Update("""
			UPDATE Item
			SET 
			quantity = quantity + IF(#{original_state}="입고",#{original_quantity}*-1,#{original_quantity})
			WHERE 
			id = #{change_id};
			""")
	public void repoReturnitemHandlingUpdate(int change_id, String original_state, int original_quantity);

}
