package com.user.management.helper;

import java.text.SimpleDateFormat;

public class FormattedDateProvider 
{

	public String getCurentDate()
	{
		java.util.Date now = new java.util.Date();
		String DATE_FORMAT = "yyyy-MM-dd hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
		String currentDate= sdf.format(now) ;
		return currentDate;
	}	
}

