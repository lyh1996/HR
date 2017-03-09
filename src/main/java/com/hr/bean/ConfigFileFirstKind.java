package com.hr.bean;

import java.io.Serializable;

 
//一级机构设置
public  class ConfigFileFirstKind  implements Serializable {
 
	private static final long serialVersionUID = -8707121009225181506L;
	private Integer ffkId;
     private Integer firstKindId;
     private String firstKindName;
     private String firstKindSalaryId;
     private String firstKindSaleId;
 
    public Integer getFfkId() {
        return this.ffkId;
    }
    
    public void setFfkId(Integer ffkId) {
        this.ffkId = ffkId;
    }

    public Integer getFirstKindId() {
        return this.firstKindId;
    }
    
    public void setFirstKindId(Integer firstKindId) {
        this.firstKindId = firstKindId;
    }

    public String getFirstKindName() {
        return this.firstKindName;
    }
    
    public void setFirstKindName(String firstKindName) {
        this.firstKindName = firstKindName;
    }

    public String getFirstKindSalaryId() {
        return this.firstKindSalaryId;
    }
    
    public void setFirstKindSalaryId(String firstKindSalaryId) {
        this.firstKindSalaryId = firstKindSalaryId;
    }

    public String getFirstKindSaleId() {
        return this.firstKindSaleId;
    }
    
    public void setFirstKindSaleId(String firstKindSaleId) {
        this.firstKindSaleId = firstKindSaleId;
    }



	@Override
	public String toString() {
		return "ConfigFileFirstKind [ffkId=" + ffkId + ", firstKindId=" + firstKindId + ", firstKindName="
				+ firstKindName + ", firstKindSalaryId=" + firstKindSalaryId + ", firstKindSaleId=" + firstKindSaleId
				+ "]";
	}



}