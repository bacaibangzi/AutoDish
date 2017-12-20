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
public class FoodType  extends CubeBaseEntity implements java.io.Serializable,Cloneable
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "FoodType";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_TYPE_ID = "typeId";
	public static final String ALIAS_TYPE_NAME = "typeName";
	public static final String ALIAS_PLAT_NO = "餐台编号";
	public static final String ALIAS_ORG_CODE = "orgCode";
	public static final String ALIAS_P1 = "p1";
	public static final String ALIAS_P2 = "p2";
	
	///date formats
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.String sn;
	private java.lang.String typeId;
	private java.lang.String typeName;
	private java.lang.String platNo;
	private java.lang.String platName;
	private java.lang.String orgCode;
	private java.lang.String p1;
	private java.lang.String p2;
	///columns END

	public FoodType(){
	}

	public FoodType(
		java.lang.String typeId
	){
		this.typeId = typeId;
	}

	public void setSn(java.lang.String value)
    {
		this.sn = value;
		this.idStr = value;
	}
	
	public java.lang.String getPlatName() {
		return platName;
	}

	public void setPlatName(java.lang.String platName) {
		this.platName = platName;
	}

	public java.lang.String getSn()
    {
		return this.sn;
	}
	public void setTypeId(java.lang.String value)
    {
		this.typeId = value;
	}
	
	public java.lang.String getTypeId()
    {
		return this.typeId;
	}
	public void setTypeName(java.lang.String value)
    {
		this.typeName = value;
	}
	
	public java.lang.String getTypeName()
    {
		return this.typeName;
	}
	public void setPlatNo(java.lang.String value)
    {
		this.platNo = value;
	}
	
	public java.lang.String getPlatNo()
    {
		return this.platNo;
	}
	public void setOrgCode(java.lang.String value)
    {
		this.orgCode = value;
	}
	
	public java.lang.String getOrgCode()
    {
		return this.orgCode;
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
     * @brief   功能: 将FoodType对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("TypeId",getTypeId())
			.append("TypeName",getTypeName())
			.append("PlatNo",getPlatNo())
			.append("OrgCode",getOrgCode())
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
			.append(getTypeId())
			.toHashCode();
	}
	
    /**
     * @brief   功能: 检测两个FoodType对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof FoodType == false) return false;
		if(this == obj) return true;
		FoodType other = (FoodType)obj;
		return new EqualsBuilder()
			.append(getTypeId(),other.getTypeId())
			.isEquals();
	}
}

