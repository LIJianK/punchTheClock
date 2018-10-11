package com.pro.util;


import java.util.List;

public class PageModel<T> {

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	private List<T> list;

	private int currentPage;
	
	private int pageSize;
	 
	private int totalRecord;
	 
	
	public int getTotalPage(){
		
		int totalPage = (this.getTotalRecord() + this.getPageSize() - 1) / this.getPageSize();
		 
		return totalPage;
	}
	
	public int getPageFrist(){
		
		return 1;
	}
	
	public int getPageUp(){
		
		if(this.getCurrentPage() <= 1){
			
			return 1;
		}
		return this.getCurrentPage()-1;
	}
	
	public int getPageDown(){
		
		if(this.getCurrentPage() >= this.getTotalPage()){
			
			if(0==this.getTotalPage()){
				return 1;
			}
			
			return this.getTotalPage();
		}
		return this.getCurrentPage()+1;
	}
	
	public int getPageEnd(){
		
		if(this.getTotalPage() == 0){
			return 1;
		}
		return this.getTotalPage();
	}
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
}
