package com.forme.biz.notice;

//게시판의 페이징 처리를 위한 값을 저장 관리
public class PagingVO {
	private int nowPage = 1; //현재페이지
	private int nowBlock = 1; //현재 블록(페이지 담는 단위)
	
	private int numPerPage = 5; //하나의 페이지에 표시할 게시글 수
	private int pagePerBlock = 3; //블록당 표시하는 페이지 갯수
	
	private int totalRecord = 0; //총 게시물 갯수(원본 게시글 수)
	private int totalPage = 0; //전체 페이지 갯수
	private int totalBlock = 0; //전체 블록 갯수
	
	private int begin = 0; //현재 페이지상의 시작 번호
	private int end = 0; //현재 페이지상의 마지막 번호
	
	private int beginPage = 0; //현재 블록의 시작 페이지 번호
	private int endPage = 0; //현재 블록의 끝 페이지 번호
	
	private int cPage = 0;//전달되는 현재 페이지 번호
	
	//전체 페이지 갯수 구하기
	//totalRecord 값을 페이지당 표시할 글의 개수 값을 나누고,
	//나머지가 있으면 페이지 하나 더 추가
	
	public void calPaging() {
		//현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		this.end = nowPage * numPerPage;
		this.begin = end - numPerPage + 1;
		
		//끝번호가 데이터 건수보다 커지면 데이터 건수와 동일하게 처리
		if (end > totalRecord) {
			this.end = totalRecord;
		}
		
		//시작블록 끝블록
		int beginPages = (nowPage - 1) / pagePerBlock * pagePerBlock + 1;
		this.beginPage = beginPages;
		this.endPage = (beginPage + pagePerBlock - 1);
		
		//끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면 끝 페이지를 전체 페이지수로 변경처리
		if(endPage > totalPage){
			this.endPage = totalPage;
		}
	}
	
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if (totalRecord % numPerPage > 0) totalPage++;
	}
	public int getcPage() {
		return cPage;
	}
	public void setcPage(int cPage) {
		this.cPage = cPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage=" + numPerPage
				+ ", pagePerBlock=" + pagePerBlock + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage
				+ ", totalBlock=" + totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + ", cPage=" + cPage + "]";
	}
	
	
}
















