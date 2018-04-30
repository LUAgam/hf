package com.hfuu.edu.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class DistanceTime {
	
	public String getAge(Date birthday){
		
		int age = new Date().getYear() - birthday.getYear();
		return String.valueOf(age);
	}
	public String getAge(String birthday) throws ParseException{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
		Date birthdaytemp = sdf.parse(birthday);
		int age = new Date().getYear() - birthdaytemp.getYear();
		return String.valueOf(age);
	}
	
	/*public static void main(String[] args) throws ParseException {
		
		String bir = "2000-02-03";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = sdf.parse(bir);
		int age = new Date().getYear() - birthday.getYear();
		
		System.out.println(age);
		
	}*/
	
	
	
	
	public String disTime(Date nowtime,Date oldtime){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		 String msg = "";
        long between = 0;
        try {
            between = (nowtime.getTime() - oldtime.getTime());// 得到两者的毫秒数
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        
        long day = between / (24 * 60 * 60 * 1000);
        long hour = (between / (60 * 60 * 1000) - day * 24);
        long min = ((between / (60 * 1000)) - day * 24 * 60 - hour * 60);
        long s = (between / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
        /*long ms = (between - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000
                - min * 60 * 1000 - s * 1000);*/
       /* System.out.println(day + "天" + hour + "小时" + min + "分" + s + "秒" + ms
                + "毫秒");*/
        if((day > 0)&&(day < 2)){
        	msg = "昨天";
        }else if((day > 1)&&(day < 3)){
        	msg = "前天";
        }else if(day > 2){
        	msg = sdf.format(oldtime);
        }else if((hour > 0)&&(day == 0)){
        	msg = String.valueOf(hour)+"小时前";
        }else
        if((min > 0)&&(hour == 0)&&(day == 0)){
        	msg = String.valueOf(min)+"分前";
        }else{
        	msg = String.valueOf(s)+"秒前";
        }
		
		
		return msg;
	}

}
