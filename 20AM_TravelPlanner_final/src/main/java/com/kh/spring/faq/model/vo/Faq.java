package com.kh.spring.faq.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Faq {
	
	private int faqNo;
	private String faqTitle;
	private String faqCategory;
	private String faqContent;
	private Date faqDate;
}
