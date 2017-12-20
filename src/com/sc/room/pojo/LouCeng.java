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
public class LouCeng extends CubeBaseEntity implements java.io.Serializable,Cloneable 
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "LouCeng";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_LOU_DONG_SN = "louDongSn";
	public static final String ALIAS_LOU_DONG_CODE = "louDongCode";
	public static final String ALIAS_LOU_DONG_NAME = "louDongName";
	public static final String ALIAS_CODE = "code";
	public static final String ALIAS_NAME = "name";
	public static final String ALIAS_REMARK = "remark";
	
	///date formats
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.Integer sn;
	private java.lang.Integer louDongSn;
	private java.lang.String louDongCode;
	private java.lang.String louDongName;
	private java.lang.String code;
	private java.lang.String name;
	private java.lang.String remark;
	///columns END

	public LouCeng(){
	}

	public LouCeng(
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
	public void setLouDongSn(java.lang.Integer value)
    {
		this.louDongSn = value;
	}
	
	public java.lang.Integer getLouDongSn()
    {
		return this.louDongSn;
	}
	public void setLouDongCode(java.lang.String value)
    {
		this.louDongCode = value;
	}
	
	public java.lang.String getLouDongCode()
    {
		return this.louDongCode;
	}
	public void setLouDongName(java.lang.String value)
    {
		this.louDongName = value;
	}
	
	public java.lang.String getLouDongName()
    {
		return this.louDongName;
	}
	public void setCode(java.lang.String value)
    {
		this.code = value;
	}
	
	public java.lang.String getCode()
    {
		return this.code;
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

    /**
     * @brief   功能: 将LouCeng对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("LouDongSn",getLouDongSn())
			.append("LouDongCode",getLouDongCode())
			.append("LouDongName",getLouDongName())
			.append("Code",getCode())
			.append("Name",getName())
			.append("Remark",getRemark())
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
     * @brief   功能: 检测两个LouCeng对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof LouCeng == false) return false;
		if(this == obj) return true;
		LouCeng other = (LouCeng)obj;
		return new EqualsBuilder()
			.append(getSn(),other.getSn())
			.isEquals();
	}
}

