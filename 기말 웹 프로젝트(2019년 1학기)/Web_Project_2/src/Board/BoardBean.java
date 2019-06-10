package Board;

import java.sql.Timestamp;


public class BoardBean {
private int idx;
private String mem_name;
private String title;
private String content;
private Timestamp reg_date;
private String pass;
private String ip;
private int count;

private String filename;
private int filesize;

public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public int getFilesize() {
	return filesize;
}
public void setFilesize(int filesize) {
	this.filesize = filesize;
}



public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public String getMem_name() {
	return mem_name;
}
public void setMem_name(String mem_name) {
	this.mem_name = mem_name;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Timestamp getReg_date() {
	return reg_date;
}
public void setReg_date(Timestamp reg_date) {
	this.reg_date = reg_date;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getIp() {
	return ip;
}
public void setIp(String ip) {
	this.ip = ip;
}
public int getCount() {
	return count;
}
public void setCount(int count) {
	this.count = count;
}



}