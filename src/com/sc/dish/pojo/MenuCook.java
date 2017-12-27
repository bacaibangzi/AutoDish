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
public class MenuCook extends CubeBaseEntity implements java.io.Serializable,Cloneable
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "MenuCook";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_DISH_SN = "dishSn";
	public static final String ALIAS_COOK_SN = "cookSn";
	public static final String ALIAS_REMARK = "remark";
	public static final String ALIAS_P1 = "p1";
	public static final String ALIAS_P2 = "p2";
	
	///date formats
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.String sn;
	private java.lang.String dishSn;
	private java.lang.String cookSn;
	private java.lang.String remark;
	private java.lang.String p1;
	private java.lang.String p2;
	///columns END

	public MenuCook(){
	}

	public MenuCook(
		java.lang.String sn
	){
		this.sn = sn;
	}

	public void setSn(java.lang.String value)
    {
		this.sn = value;
		this.idStr = value;
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
	public void setCookSn(java.lang.String value)
    {
		this.cookSn = value;
	}
	
	public java.lang.String getCookSn()
    {
		return this.cookSn;
	}
	public void setRemark(java.lang.String value)
    {
		this.remark = value;
	}
	
	public java.lang.String getRemark()
    {
		return this.remark;
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
     * @brief   功能: 将MenuCook对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("DishSn",getDishSn())
			.append("CookSn",getCookSn())
			.append("Remark",getRemark())
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
     * @brief   功能: 检测两个MenuCook对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof MenuCook == false) return false;
		if(this == obj) return true;
		MenuCook other = (MenuCook)obj;
		return new EqualsBuilder()
			.append(getSn(),other.getSn())
			.isEquals();
	}
}

