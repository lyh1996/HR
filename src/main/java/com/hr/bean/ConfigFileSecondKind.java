package com.hr.bean;

import java.io.Serializable;

//二级机构实体
public   class ConfigFileSecondKind  implements  Serializable {

     /**
	 * 
	 */
	private static final long serialVersionUID = -5474770258280221458L;
	private Integer fsk_id;
     private Integer first_kind_id;
     private String first_kind_name;
     private Integer second_kind_id;
     private String second_kind_name;
     private String second_salary_id;
     private String second_sale_id;
     private Page page;
 
    // Property accessors

    public Integer getfsk_id() {
        return this.fsk_id;
    }
    
    public void setfsk_id(Integer fsk_id) {
        this.fsk_id = fsk_id;
    }

    public Integer getfirst_kind_id() {
        return this.first_kind_id;
    }
    
    public void setfirst_kind_id(Integer first_kind_id) {
        this.first_kind_id = first_kind_id;
    }

    public String getfirst_kind_name() {
        return this.first_kind_name;
    }
    
    public void setfirst_kind_name(String first_kind_name) {
        this.first_kind_name = first_kind_name;
    }

    public Integer getsecond_kind_id() {
        return this.second_kind_id;
    }
    
    public void setsecond_kind_id(Integer second_kind_id) {
        this.second_kind_id = second_kind_id;
    }

    public String getsecond_kind_name() {
        return this.second_kind_name;
    }
    
    public void setsecond_kind_name(String second_kind_name) {
        this.second_kind_name = second_kind_name;
    }

    public String getsecond_salary_id() {
        return this.second_salary_id;
    }
    
    public void setsecond_salary_id(String second_salary_id) {
        this.second_salary_id = second_salary_id;
    }

    public String getsecond_sale_id() {
        return this.second_sale_id;
    }
    
    public void setsecond_sale_id(String second_sale_id) {
        this.second_sale_id = second_sale_id;
    }

    
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "ConfigFileSecondKind [fsk_id=" + fsk_id + ", first_kind_id=" + first_kind_id + ", first_kind_name="
				+ first_kind_name + ", second_kind_id=" + second_kind_id + ", second_kind_name=" + second_kind_name
				+ ", second_salary_id=" + second_salary_id + ", second_sale_id=" + second_sale_id + ", page=" + page
				+ "]";
	}
 


}