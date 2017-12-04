package net.eoutech.webmin.commons.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

public class CommonOutlineInfoVO{
	private int outlineInfo1;
	private int outlineInfo2;
	private int outlineInfo3;
	private int outlineInfo4;
	
	private int outlineInfo5;
	private int outlineInfo6;
	private int outlineInfo7;
	private int outlineInfo8;
	
	private int outlineInfo9;
	private int outlineInfo10;
	private int outlineInfo11;
	private int outlineInfo12;
	//其他
	private String data1 = "-";
	private String data2 = "-";
	private String data3 = "-";
	private String data4 = "-";
	
	//simcard中的几个数据
	private String keySimCardID;
	@JSONField(format = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mdfTm;
	private int mdfDays;
	private int restNetData;
	//世界地图-设备分布图统计
	private String code;
	private String name = "country";
	private int value;
	private String color = "#eea638";
	//private String seriesName;
	
	//一个月的数据
	private int day1count;
	private int day2count;
	private int day3count;
	private int day4count;
	private int day5count;
	private int day6count;
	private int day7count;
	private int day8count;
	private int day9count;
	private int day10count;
	private int day11count;
	private int day12count;
	private int day13count;
	private int day14count;
	private int day15count;
	private int day16count;
	private int day17count;
	private int day18count;
	private int day19count;
	private int day20count;
	private int day21count;
	private int day22count;
	private int day23count;
	private int day24count;
	private int day25count;
	private int day26count;
	private int day27count;
	private int day28count;
	private int day29count;
	private int day30count;
	
	
	public int getOutlineInfo1() {
		return outlineInfo1;
	}
	public void setOutlineInfo1(int outlineInfo1) {
		this.outlineInfo1 = outlineInfo1;
	}
	public int getOutlineInfo2() {
		return outlineInfo2;
	}
	public void setOutlineInfo2(int outlineInfo2) {
		this.outlineInfo2 = outlineInfo2;
	}
	public int getOutlineInfo3() {
		return outlineInfo3;
	}
	public void setOutlineInfo3(int outlineInfo3) {
		this.outlineInfo3 = outlineInfo3;
	}
	public int getOutlineInfo4() {
		return outlineInfo4;
	}
	public void setOutlineInfo4(int outlineInfo4) {
		this.outlineInfo4 = outlineInfo4;
	}
	public int getOutlineInfo5() {
		return outlineInfo5;
	}
	public void setOutlineInfo5(int outlineInfo5) {
		this.outlineInfo5 = outlineInfo5;
	}
	public int getOutlineInfo6() {
		return outlineInfo6;
	}
	public void setOutlineInfo6(int outlineInfo6) {
		this.outlineInfo6 = outlineInfo6;
	}
	public int getOutlineInfo7() {
		return outlineInfo7;
	}
	public void setOutlineInfo7(int outlineInfo7) {
		this.outlineInfo7 = outlineInfo7;
	}
	public int getOutlineInfo8() {
		return outlineInfo8;
	}
	public void setOutlineInfo8(int outlineInfo8) {
		this.outlineInfo8 = outlineInfo8;
	}
	public int getOutlineInfo9() {
		return outlineInfo9;
	}
	public void setOutlineInfo9(int outlineInfo9) {
		this.outlineInfo9 = outlineInfo9;
	}
	public int getOutlineInfo10() {
		return outlineInfo10;
	}
	public void setOutlineInfo10(int outlineInfo10) {
		this.outlineInfo10 = outlineInfo10;
	}
	public int getOutlineInfo11() {
		return outlineInfo11;
	}
	public void setOutlineInfo11(int outlineInfo11) {
		this.outlineInfo11 = outlineInfo11;
	}
	public int getOutlineInfo12() {
		return outlineInfo12;
	}
	public void setOutlineInfo12(int outlineInfo12) {
		this.outlineInfo12 = outlineInfo12;
	}
	public String getData1() {
		return data1;
	}
	public void setData1(String data1) {
		this.data1 = data1;
	}
	public String getData2() {
		return data2;
	}
	public void setData2(String data2) {
		this.data2 = data2;
	}
	public String getData3() {
		return data3;
	}
	public void setData3(String data3) {
		this.data3 = data3;
	}
	public String getData4() {
		return data4;
	}
	public void setData4(String data4) {
		this.data4 = data4;
	}
	public int getDay1count() {
		return day1count;
	}
	public void setDay1count(int day1count) {
		this.day1count = day1count;
	}
	public int getDay2count() {
		return day2count;
	}
	public void setDay2count(int day2count) {
		this.day2count = day2count;
	}
	public int getDay3count() {
		return day3count;
	}
	public void setDay3count(int day3count) {
		this.day3count = day3count;
	}
	public int getDay4count() {
		return day4count;
	}
	public void setDay4count(int day4count) {
		this.day4count = day4count;
	}
	public int getDay5count() {
		return day5count;
	}
	public void setDay5count(int day5count) {
		this.day5count = day5count;
	}
	public int getDay6count() {
		return day6count;
	}
	public void setDay6count(int day6count) {
		this.day6count = day6count;
	}
	public int getDay7count() {
		return day7count;
	}
	public void setDay7count(int day7count) {
		this.day7count = day7count;
	}
	public int getDay8count() {
		return day8count;
	}
	public void setDay8count(int day8count) {
		this.day8count = day8count;
	}
	public int getDay9count() {
		return day9count;
	}
	public void setDay9count(int day9count) {
		this.day9count = day9count;
	}
	public int getDay10count() {
		return day10count;
	}
	public void setDay10count(int day10count) {
		this.day10count = day10count;
	}
	public int getDay11count() {
		return day11count;
	}
	public void setDay11count(int day11count) {
		this.day11count = day11count;
	}
	public int getDay12count() {
		return day12count;
	}
	public void setDay12count(int day12count) {
		this.day12count = day12count;
	}
	public int getDay13count() {
		return day13count;
	}
	public void setDay13count(int day13count) {
		this.day13count = day13count;
	}
	public int getDay14count() {
		return day14count;
	}
	public void setDay14count(int day14count) {
		this.day14count = day14count;
	}
	public int getDay15count() {
		return day15count;
	}
	public void setDay15count(int day15count) {
		this.day15count = day15count;
	}
	public int getDay16count() {
		return day16count;
	}
	public void setDay16count(int day16count) {
		this.day16count = day16count;
	}
	public int getDay17count() {
		return day17count;
	}
	public void setDay17count(int day17count) {
		this.day17count = day17count;
	}
	public int getDay18count() {
		return day18count;
	}
	public void setDay18count(int day18count) {
		this.day18count = day18count;
	}
	public int getDay19count() {
		return day19count;
	}
	public void setDay19count(int day19count) {
		this.day19count = day19count;
	}
	public int getDay20count() {
		return day20count;
	}
	public void setDay20count(int day20count) {
		this.day20count = day20count;
	}
	public int getDay21count() {
		return day21count;
	}
	public void setDay21count(int day21count) {
		this.day21count = day21count;
	}
	public int getDay22count() {
		return day22count;
	}
	public void setDay22count(int day22count) {
		this.day22count = day22count;
	}
	public int getDay23count() {
		return day23count;
	}
	public void setDay23count(int day23count) {
		this.day23count = day23count;
	}
	public int getDay24count() {
		return day24count;
	}
	public void setDay24count(int day24count) {
		this.day24count = day24count;
	}
	public int getDay25count() {
		return day25count;
	}
	public void setDay25count(int day25count) {
		this.day25count = day25count;
	}
	public int getDay26count() {
		return day26count;
	}
	public void setDay26count(int day26count) {
		this.day26count = day26count;
	}
	public int getDay27count() {
		return day27count;
	}
	public void setDay27count(int day27count) {
		this.day27count = day27count;
	}
	public int getDay28count() {
		return day28count;
	}
	public void setDay28count(int day28count) {
		this.day28count = day28count;
	}
	public int getDay29count() {
		return day29count;
	}
	public void setDay29count(int day29count) {
		this.day29count = day29count;
	}
	public int getDay30count() {
		return day30count;
	}
	public void setDay30count(int day30count) {
		this.day30count = day30count;
	}
	public String getKeySimCardID() {
		return keySimCardID;
	}
	public void setKeySimCardID(String keySimCardID) {
		this.keySimCardID = keySimCardID;
	}
	public int getMdfDays() {
		return mdfDays;
	}
	public void setMdfDays(int mdfDays) {
		this.mdfDays = mdfDays;
	}
	public int getRestNetData() {
		return restNetData;
	}
	public void setRestNetData(int restNetData) {
		this.restNetData = restNetData;
	}
	public Date getMdfTm() {
		return mdfTm;
	}
	public void setMdfTm(Date mdfTm) {
		this.mdfTm = mdfTm;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}