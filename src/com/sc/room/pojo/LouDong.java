package com.sc.room.pojo;

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
public class LouDong extends CubeBaseEntity implements java.io.Serializable,Cloneable 
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "LouDong";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_NO = "no";
	public static final String ALIAS_NAME = "name";
	public static final String ALIAS_REMARK = "remark";
	public static final String ALIAS_FZR = "fzr";
	public static final String ALIAS_FZR_TEL = "fzrTel";
	
	///date formats
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.Integer sn;
	private java.lang.String no;
	private java.lang.String name;
	private java.lang.String remark;
	private java.lang.String fzr;
	private java.lang.String fzrTel;
	///columns END

	public LouDong(){
	}

	public LouDong(
		java.lang.Integer sn
	){
		this.sn = sn;
	}

	public void setSn(java.lang.Integer value)
    {
		this.sn = value;
		this.idStr = String.valueOf(value);
	}
	
	public java.lang.Integer getSn()
    {
		return this.sn;
	}
	public void setNo(java.lang.String value)
    {
		this.no = value;
	}
	
	public java.lang.String getNo()
    {
		return this.no;
	}
	public void setName(java.lang.String value)
    {
		this.name = value;
	}
	
	public java.lang.String getName()
    {
		return this.name;
	}
	public void setRemark(java.lang.String value)
    {
		this.remark = value;
	}
	
	public java.lang.String getRemark()
    {
		return this.remark;
	}
	public void setFzr(java.lang.String value)
    {
		this.fzr = value;
	}
	
	public java.lang.String getFzr()
    {
		return this.fzr;
	}
	public void setFzrTel(java.lang.String value)
    {
		this.fzrTel = value;
	}
	
	public java.lang.String getFzrTel()
    {
		return this.fzrTel;
	}

    /**
     * @brief   功能: 将LouDong对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("No",getNo())
			.append("Name",getName())
			.append("Remark",getRemark())
			.append("Fzr",getFzr())
			.append("FzrTel",getFzrTel())
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
     * @brief   功能: 检测两个LouDong对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof LouDong == false) return false;
		if(this == obj) return true;
		LouDong other = (LouDong)obj;
		return new EqualsBuilder()
			.append(getSn(),other.getSn())
			.isEquals();
	}
}

