package com.sc.room.pojo;

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
public class Customer extends CubeBaseEntity implements java.io.Serializable,Cloneable 
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "Customer";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_NAME = "name";
	public static final String ALIAS_SEX = "sex";
	public static final String ALIAS_TEL = "tel";
	public static final String ALIAS_SFZ = "sfz";
	public static final String ALIAS_STATE = "state";
	public static final String ALIAS_DATE = "date";
	
	///date formats
	public static final String FORMAT_DATE = "yyyy-MM-dd HH:mm:ss";
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.Integer sn;
	private java.lang.String name ="";
	private java.lang.String sex ="";
	private java.lang.String tel ="";
	private java.lang.String sfz ="";
	private java.lang.String state ="";
	private java.util.Date date;
	private String stateStr = "";
	private String openid ="";
	
	private String loudong = "";
	private String louceng = "";
	private String room = "";
	///columns END

	public Customer(){
	}

	public Customer(
		java.lang.Integer sn
	){
		this.sn = sn;
	}

	public void setSn(java.lang.Integer value)
    {
		this.sn = value;
		this.idStr = String.valueOf(value);
	}
	
	public String getLoudong() {
		return loudong;
	}

	public void setLoudong(String loudong) {
		this.loudong = loudong;
	}

	public String getLouceng() {
		return louceng;
	}

	public void setLouceng(String louceng) {
		this.louceng = louceng;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public java.lang.Integer getSn()
    {
		return this.sn;
	}
	public void setName(java.lang.String value)
    {
		this.name = value;
	}
	
	public String getStateStr() {
		return stateStr;
	}

	public void setStateStr(String stateStr) {
		this.stateStr = stateStr;
	}

	public java.lang.String getName()
    {
		return this.name;
	}
	public void setSex(java.lang.String value)
    {
		this.sex = value;
	}
	
	public java.lang.String getSex()
    {
		return this.sex;
	}
	public void setTel(java.lang.String value)
    {
		this.tel = value;
	}
	
	public java.lang.String getTel()
    {
		return this.tel;
	}
	public void setSfz(java.lang.String value)
    {
		this.sfz = value;
	}
	
	public java.lang.String getSfz()
    {
		return this.sfz;
	}
	public void setState(java.lang.String value)
    {
		this.state = value;
		if("0".equals(value)){
			this.setStateStr("未审核");
		}else if("1".equals(value)){
			this.setStateStr("已审核");
		}
	}
	
	public java.lang.String getState()
    {
		return this.state;
	}
	public String getDateString()
    {
		return DateConvertUtils.format(getDate(), FORMAT_DATE);
	}
	public void setDateString(String value)
    {
		setDate(DateConvertUtils.parse(value, FORMAT_DATE,java.util.Date.class));
	}
	
	public void setDate(java.util.Date value)
    {
		this.date = value;
	}
	
	public java.util.Date getDate()
    {
		return this.date;
	}

    public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	/**
     * @brief   功能: 将Customer对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("Name",getName())
			.append("Sex",getSex())
			.append("Tel",getTel())
			.append("Sfz",getSfz())
			.append("State",getState())
			.append("Date",getDate())
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
     * @brief   功能: 检测两个Customer对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof Customer == false) return false;
		if(this == obj) return true;
		Customer other = (Customer)obj;
		return new EqualsBuilder()
			.append(getSn(),other.getSn())
			.isEquals();
	}
}

