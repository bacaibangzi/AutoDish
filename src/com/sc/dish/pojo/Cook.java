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
public class Cook extends CubeBaseEntity implements java.io.Serializable,Cloneable
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "Cook";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_NAME = "name";
	public static final String ALIAS_SEX = "sex";
	public static final String ALIAS_BIRTHDAY = "birthday";
	public static final String ALIAS_PHONE = "phone";
	public static final String ALIAS_REMARK = "remark";
	public static final String ALIAS_ORG_CODE = "orgCode";
	public static final String ALIAS_P1 = "p1";
	public static final String ALIAS_P2 = "p2";
	
	///date formats
	public static final String FORMAT_BIRTHDAY = "yyyy-MM-dd HH:mm:ss";
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.String sn;
	private String no;
	private java.lang.String name;
	private java.lang.String sex;
	private java.lang.String sexStr;
	private java.util.Date birthday;
	private java.lang.String phone;
	private java.lang.String remark;
	private java.lang.String orgCode;
	private java.lang.String p1;
	private java.lang.String p2;
	private String zjh;
	///columns END

	public Cook(){
	}

	public String getZjh() {
		return zjh;
	}

	public void setZjh(String zjh) {
		this.zjh = zjh;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Cook(
		java.lang.String sn
	){
		this.sn = sn;
	}

	public java.lang.String getSexStr() {
		return sexStr;
	}

	public void setSexStr(java.lang.String sexStr) {
		this.sexStr = sexStr;
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
	public void setName(java.lang.String value)
    {
		this.name = value;
	}
	
	public java.lang.String getName()
    {
		return this.name;
	}
	public void setSex(java.lang.String value)
    {
		this.sex = value;
		if("0".equals(value)){
			this.setSexStr("女");
		}else{
			this.setSexStr("男");
		}
	}
	
	public java.lang.String getSex()
    {
		return this.sex;
	}
	public String getBirthdayString()
    {
		return DateConvertUtils.format(getBirthday(), FORMAT_BIRTHDAY);
	}
	public void setBirthdayString(String value)
    {
		setBirthday(DateConvertUtils.parse(value, FORMAT_BIRTHDAY,java.util.Date.class));
	}
	
	public void setBirthday(java.util.Date value)
    {
		this.birthday = value;
	}
	
	public java.util.Date getBirthday()
    {
		return this.birthday;
	}
	public void setPhone(java.lang.String value)
    {
		this.phone = value;
	}
	
	public java.lang.String getPhone()
    {
		return this.phone;
	}
	public void setRemark(java.lang.String value)
    {
		this.remark = value;
	}
	
	public java.lang.String getRemark()
    {
		return this.remark;
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
     * @brief   功能: 将Cook对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("Name",getName())
			.append("Sex",getSex())
			.append("Birthday",getBirthday())
			.append("Phone",getPhone())
			.append("Remark",getRemark())
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
			.append(getSn())
			.toHashCode();
	}
	
    /**
     * @brief   功能: 检测两个Cook对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof Cook == false) return false;
		if(this == obj) return true;
		Cook other = (Cook)obj;
		return new EqualsBuilder()
			.append(getSn(),other.getSn())
			.isEquals();
	}
}

