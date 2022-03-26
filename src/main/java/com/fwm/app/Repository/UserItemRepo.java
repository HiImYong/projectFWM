package com.fwm.app.Repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

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
	public void repoDoitemHandling(int change_id, int change_state, int place, String change_date, int change_quantity);

	
	@Update("""
	UPDATE Item 
	SET quantity = quantity + IF(#{change_state}=2,#{change_quantity}*-1,#{change_quantity})
	WHERE id = #{change_id};			
	""")	
	public void repoDoitemHandlingUpdate(int change_id, int change_state, int change_quantity);
	
	


}
