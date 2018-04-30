package com.hfuu.edu.common;

public class QueryInfo {
	
	private int currentpage = 1;  //�û���ǰ����ҳ 3
	private int pagesize = 5;     //��ס�û��뿴��ҳ���С 5
	private int startindex;     //��ס�û�����ҳ�����������ݿ����ʼλ��
	
	
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getStartindex() {
		this.startindex = (this.currentpage-1)*this.pagesize;
		return startindex;
	}
}
