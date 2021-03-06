package com.sc.dish.pojo;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.sc.framework.base.pojo.CubeBaseEntity;

/**
 * @ingroup system
 * @author  
 * @brief   类简单描述
 *
 * 类功能详细描述
 */
public class MenuNutrition extends CubeBaseEntity implements java.io.Serializable,Cloneable
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "MenuNutrition";
	public static final String ALIAS_SN = "菜品营养";
	public static final String ALIAS_DISH_SN = "dishSn";
	public static final String ALIAS_MATERIAL_SN = "materialSn";
	public static final String ALIAS_NUM = "num";
	public static final String ALIAS_P1 = "p1";
	public static final String ALIAS_P2 = "菜品原料";
	
	///date formats
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.String sn;
	private java.lang.String dishSn;
	private java.lang.String materialSn;
	private java.lang.Integer num;
	private String unit;
	private java.lang.String p1;
	private java.lang.String p2;
	private java.lang.String nutritionName;
	private java.lang.String nutritionNo;
	///columns END

	public MenuNutrition(){
	}

	public MenuNutrition(
		java.lang.String sn
	){
		this.sn = sn;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public void setSn(java.lang.String value)
    {
		this.sn = value;
		this.idStr = value;
	}

	public java.lang.String getNutritionName() {
		return nutritionName;
	}

	public void setNutritionName(java.lang.String nutritionName) {
		this.nutritionName = nutritionName;
	}

	public java.lang.String getNutritionNo() {
		return nutritionNo;
	}

	public void setNutritionNo(java.lang.String nutritionNo) {
		this.nutritionNo = nutritionNo;
	}

	public java.lang.String getSn()
    {
		return this.sn;
	}
	public void setDishSn(java.lang.String value)
    {
		this.dishSn = value;
	}
	
	public java.lang.String getDishSn()
    {
		return this.dishSn;
	}
	public void setMaterialSn(java.lang.String value)
    {
		this.materialSn = value;
	}
	
	public java.lang.String getMaterialSn()
    {
		return this.materialSn;
	}
	public void setNum(java.lang.Integer value)
    {
		this.num = value;
	}
	
	public java.lang.Integer getNum()
    {
		return this.num;
	}
	public void setP1(java.lang.String value)
    {
		this.p1 = value;
	}
	
	public java.lang.String getP1()
    {
		return this.p1;
	}
	public void setP2(java.lang.String value)
    {
		this.p2 = value;
	}
	
	public java.lang.String getP2()
    {
		return this.p2;
	}

    /**
     * @brief   功能: 将MenuNutrition对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("DishSn",getDishSn())
			.append("MaterialSn",getMaterialSn())
			.append("Num",getNum())
			.append("P1",getP1())
			.append("P2",getP2())
			.toString();
	}
	
    /**
     * @brief   功能: 
     * @param   
     * @return  
     */
	public int hashCode()
    {
		return new HashCodeBuilder()
			.append(getSn())
			.toHashCode();
	}
	
    /**
     * @brief   功能: 检测两个MenuNutrition对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof MenuNutrition == false) return false;
		if(this == obj) return true;
		MenuNutrition other = (MenuNutrition)obj;
		return new EqualsBuilder()
			.append(getSn(),other.getSn())
			.isEquals();
	}
}

