package com.sc.dish.pojo;

import java.util.ArrayList;
import java.util.List;

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
public class TbasMenu extends CubeBaseEntity implements java.io.Serializable,Cloneable
{
	private static final long serialVersionUID = 5454155825314635342L;
	
	///alias
	public static final String TABLE_ALIAS = "TbasMenu";
	public static final String ALIAS_SN = "sn";
	public static final String ALIAS_PLAT_NO = "餐台编号";
	public static final String ALIAS_FOOD_NO = "菜编号";
	public static final String ALIAS_FOOD_NAME = "菜名称";
	public static final String ALIAS_FOOD_TYPE = "所属分类";
	public static final String ALIAS_WEIGHT_UNIT = "重量单位编号";
	public static final String ALIAS_PRICE_UNIT = "单价";
	public static final String ALIAS_START_WEIGHT = "最小销售重量";
	public static final String ALIAS_USE_FLAG = "启用标识，0不启用，1启用";
	public static final String ALIAS_START_DATE = "起售日期";
	public static final String ALIAS_OPERATOR = "操作人";
	public static final String ALIAS_OPERATE_TIME = "操作时间";
	public static final String ALIAS_ORG_CODE = "orgCode";
	public static final String ALIAS_P1 = "p1";
	public static final String ALIAS_P2 = "p2";
	
	///date formats
	public static final String FORMAT_START_DATE = "yyyy-MM-dd HH:mm:ss";
	public static final String FORMAT_OPERATE_TIME = "yyyy-MM-dd HH:mm:ss";
	
	///可以直接使用: @Length(max=50,message="用户名长度不能大于50")显示错误消息
	///columns START
	private java.lang.String sn;
	private java.lang.String platNo;
	private java.lang.String platName;
	private java.lang.String foodNo;
	private java.lang.String foodName;
	private java.lang.String foodType;
	private java.lang.String weightUnit;
	private Long priceUnit;
	private Long startWeight;
	private java.lang.Integer useFlag;
	private java.util.Date startDate;
	private java.lang.String operator;
	private java.util.Date operateTime;
	private java.lang.String orgCode;
	private java.lang.String p1;
	private java.lang.String p2;
	private String cook;
	private String potNo;
	
	private List<MealTime> mealTime= new ArrayList<MealTime>();// 餐次
	private List<Nutrition> nutrition= new ArrayList<Nutrition>(); //营养
	private List<Material> material= new ArrayList<Material>(); // 原料
	
	///columns END

	public TbasMenu(){
	}

	public String getCook() {
		return cook;
	}

	public void setCook(String cook) {
		this.cook = cook;
	}

	public String getPotNo() {
		return potNo;
	}

	public void setPotNo(String potNo) {
		this.potNo = potNo;
	}

	public TbasMenu(
		java.lang.String platNo
	){
		this.platNo = platNo;
	}

	public java.lang.String getPlatName() {
		return platName;
	}

	public void setPlatName(java.lang.String platName) {
		this.platName = platName;
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
	public void setFoodNo(java.lang.String value)
    {
		this.foodNo = value;
	}
	
	public java.lang.String getFoodNo()
    {
		return this.foodNo;
	}
	public void setFoodName(java.lang.String value)
    {
		this.foodName = value;
	}
	
	public java.lang.String getFoodName()
    {
		return this.foodName;
	}
	public void setFoodType(java.lang.String value)
    {
		this.foodType = value;
	}
	
	public java.lang.String getFoodType()
    {
		return this.foodType;
	}
	public void setWeightUnit(java.lang.String value)
    {
		this.weightUnit = value;
	}
	
	public java.lang.String getWeightUnit()
    {
		return this.weightUnit;
	}
	public void setPriceUnit(Long value)
    {
		this.priceUnit = value;
	}
	
	public Long getPriceUnit()
    {
		return this.priceUnit;
	}
	public void setStartWeight(Long value)
    {
		this.startWeight = value;
	}
	
	public Long getStartWeight()
    {
		return this.startWeight;
	}
	public void setUseFlag(java.lang.Integer value)
    {
		this.useFlag = value;
	}
	
	public java.lang.Integer getUseFlag()
    {
		return this.useFlag;
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
	public void setOperator(java.lang.String value)
    {
		this.operator = value;
	}
	
	public java.lang.String getOperator()
    {
		return this.operator;
	}
	public String getOperateTimeString()
    {
		return DateConvertUtils.format(getOperateTime(), FORMAT_OPERATE_TIME);
	}
	public void setOperateTimeString(String value)
    {
		setOperateTime(DateConvertUtils.parse(value, FORMAT_OPERATE_TIME,java.util.Date.class));
	}
	
	public void setOperateTime(java.util.Date value)
    {
		this.operateTime = value;
	}
	
	public java.util.Date getOperateTime()
    {
		return this.operateTime;
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

    public List<MealTime> getMealTime() {
		return mealTime;
	}

	public void setMealTime(List<MealTime> mealTime) {
		this.mealTime = mealTime;
	}

	public List<Nutrition> getNutrition() {
		return nutrition;
	}

	public void setNutrition(List<Nutrition> nutrition) {
		this.nutrition = nutrition;
	}

	public List<Material> getMaterial() {
		return material;
	}

	public void setMaterial(List<Material> material) {
		this.material = material;
	}

	/**
     * @brief   功能: 将TbasMenu对象数据进行串化
     * @param   
     * @return  
     */
	public String toString()
    {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
			.append("Sn",getSn())
			.append("PlatNo",getPlatNo())
			.append("FoodNo",getFoodNo())
			.append("FoodName",getFoodName())
			.append("FoodType",getFoodType())
			.append("WeightUnit",getWeightUnit())
			.append("PriceUnit",getPriceUnit())
			.append("StartWeight",getStartWeight())
			.append("UseFlag",getUseFlag())
			.append("StartDate",getStartDate())
			.append("Operator",getOperator())
			.append("OperateTime",getOperateTime())
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
     * @brief   功能: 检测两个TbasMenu对象是否相同
     * @param   
     * @return  
     */
	public boolean equals(Object obj) {
		if(obj instanceof TbasMenu == false) return false;
		if(this == obj) return true;
		TbasMenu other = (TbasMenu)obj;
		return new EqualsBuilder()
			.append(getPlatNo(),other.getPlatNo())
			.isEquals();
	}
}

