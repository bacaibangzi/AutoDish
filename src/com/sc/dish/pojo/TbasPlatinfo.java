package com.sc.dish.pojo;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.sc.framework.base.pojo.CubeBaseEntity;
import com.sc.framework.utils.DateConvertUtils;

/**
 * @ingroup system
 * @author  
 * @brief   类简单描述
 *
 * 类功能详细描述
 */
public class TbasPlatinfo extends CubeBaseEntity implements java.io.Serializable,Cloneable
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "TbasPlatinfo";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_PLAT_NO = "platNo";
	public static final String ALIAS_PLAT_NAME = "platName";
	public static final String ALIAS_BOSSNAME = "bossname";
	public static final String ALIAS_PHONE = "phone";
	public static final String ALIAS_LOCATION = "location";
	public static final String ALIAS_DEPART_CODE = "所属单位编号";
	public static final String ALIAS_STATION_CODE = "所属食堂编号";
	public static final String ALIAS_START_DATE = "startDate";
	public static final String ALIAS_ORG_CODE = "orgCode";
	public static final String ALIAS_P1 = "p1";
	public static final String ALIAS_P2 = "p2";
	
	///date formats
	public static final String FORMAT_START_DATE = "yyyy-MM-dd HH:mm:ss";
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.String sn;
	private java.lang.String platNo;
	private java.lang.String platName;
	private java.lang.String bossname;
	private java.lang.String phone;
	private java.lang.String location;
	private java.lang.String departCode;
	private java.lang.String stationCode;
	private java.util.Date startDate;
	private java.lang.String orgCode;
	private java.lang.String p1;
	private java.lang.String p2;
	///columns END

	public TbasPlatinfo(){
	}

	public TbasPlatinfo(
		java.lang.String platNo
	){
		this.platNo = platNo;
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
	public void setPlatNo(java.lang.String value)
    {
		this.platNo = value;
	}
	
	public java.lang.String getPlatNo()
    {
		return this.platNo;
	}
	public void setPlatName(java.lang.String value)
    {
		this.platName = value;
	}
	
	public java.lang.String getPlatName()
    {
		return this.platName;
	}
	public void setBossname(java.lang.String value)
    {
		this.bossname = value;
	}
	
	public java.lang.String getBossname()
    {
		return this.bossname;
	}
	public void setPhone(java.lang.String value)
    {
		this.phone = value;
	}
	
	public java.lang.String getPhone()
    {
		return this.phone;
	}
	public void setLocation(java.lang.String value)
    {
		this.location = value;
	}
	
	public java.lang.String getLocation()
    {
		return this.location;
	}
	public void setDepartCode(java.lang.String value)
    {
		this.departCode = value;
	}
	
	public java.lang.String getDepartCode()
    {
		return this.departCode;
	}
	public void setStationCode(java.lang.String value)
    {
		this.stationCode = value;
	}
	
	public java.lang.String getStationCode()
    {
		return this.stationCode;
	}
	public String getStartDateString()
    {
		return DateConvertUtils.format(getStartDate(), FORMAT_START_DATE);
	}
	public void setStartDateString(String value)
    {
		setStartDate(DateConvertUtils.parse(value, FORMAT_START_DATE,java.util.Date.class));
	}
	
	public void setStartDate(java.util.Date value)
    {
		this.startDate = value;
	}
	
	public java.util.Date getStartDate()
    {
		return this.startDate;
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
     * @brief   功能: 将TbasPlatinfo对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("PlatNo",getPlatNo())
			.append("PlatName",getPlatName())
			.append("Bossname",getBossname())
			.append("Phone",getPhone())
			.append("Location",getLocation())
			.append("DepartCode",getDepartCode())
			.append("StationCode",getStationCode())
			.append("StartDate",getStartDate())
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
			.append(getPlatNo())
			.toHashCode();
	}
	
    /**
     * @brief   功能: 检测两个TbasPlatinfo对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof TbasPlatinfo == false) return false;
		if(this == obj) return true;
		TbasPlatinfo other = (TbasPlatinfo)obj;
		return new EqualsBuilder()
			.append(getPlatNo(),other.getPlatNo())
			.isEquals();
	}
}

