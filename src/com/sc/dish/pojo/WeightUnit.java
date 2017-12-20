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
public class WeightUnit extends CubeBaseEntity implements java.io.Serializable,Cloneable
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "WeightUnit";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_UNIT_ID = "unitId";
	public static final String ALIAS_UNIT_NAME = "unitName";
	public static final String ALIAS_PLAT_NO = "platNo";
	public static final String ALIAS_UNIT_ZHXS = "unitZhxs";
	public static final String ALIAS_ORG_CODE = "orgCode";
	public static final String ALIAS_P1 = "p1";
	public static final String ALIAS_P2 = "p2";
	
	///date formats
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.String sn;
	private java.lang.String unitId;
	private java.lang.String unitName;
	private java.lang.String platNo;
	private java.lang.String platName;
	private java.lang.Float unitZhxs;
	private java.lang.String orgCode;
	private java.lang.String p1;
	private java.lang.String p2;
	///columns END

	public WeightUnit(){
	}

	public WeightUnit(
		java.lang.String unitId
	){
		this.unitId = unitId;
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
	public void setUnitId(java.lang.String value)
    {
		this.unitId = value;
	}
	
	public java.lang.String getUnitId()
    {
		return this.unitId;
	}
	public void setUnitName(java.lang.String value)
    {
		this.unitName = value;
	}
	
	public java.lang.String getUnitName()
    {
		return this.unitName;
	}
	public void setPlatNo(java.lang.String value)
    {
		this.platNo = value;
	}
	
	public java.lang.String getPlatNo()
    {
		return this.platNo;
	}
	public void setUnitZhxs(java.lang.Float value)
    {
		this.unitZhxs = value;
	}
	
	public java.lang.Float getUnitZhxs()
    {
		return this.unitZhxs;
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
     * @brief   功能: 将WeightUnit对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("UnitId",getUnitId())
			.append("UnitName",getUnitName())
			.append("PlatNo",getPlatNo())
			.append("UnitZhxs",getUnitZhxs())
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
			.append(getUnitId())
			.toHashCode();
	}
	
    /**
     * @brief   功能: 检测两个WeightUnit对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof WeightUnit == false) return false;
		if(this == obj) return true;
		WeightUnit other = (WeightUnit)obj;
		return new EqualsBuilder()
			.append(getUnitId(),other.getUnitId())
			.isEquals();
	}
}

