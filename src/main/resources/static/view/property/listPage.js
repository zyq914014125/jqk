//init
function arrayPage(pages, total) {
	function getParameter(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}

	// init
	$(function() {
		var totalPage = pages;
		var totalRecords = total;
		var pageNo = getParameter('pageNumber');
		if (!pageNo) {
			pageNo = 1;
		}
		// 生成分页
		jpager.generPageHtml({
			pno : pageNo,
			// 总页码
			total : totalPage,
			// 总数据条数
			totalRecords : totalRecords,
			// 链接前部
			hrefFormer : 'propertyController/showAllProperty',
			// 链接尾部
			hrefLatter : '.do',
			getLink : function(n) {
				// alert(n);
				return this.hrefFormer + this.hrefLatter + "?pageNumber=" + n;
			},
		/*
		 * lang : { firstPageText : '|<', lastPageText : '>|', prePageText : '<',
		 * nextPageText : '>', totalPageBeforeText : '共', totalPageAfterText :
		 * '页', totalRecordsAfterText : '条数据', gopageBeforeText : '转到',
		 * gopageButtonOkText : '确定', gopageAfterText : '页', buttonTipBeforeText :
		 * '第', buttonTipAfterText : '页' }
		 */
		// ,
		// mode : 'click',//默认值是link，可选link或者click
		/*
		 * click : function(n){ //this.selectPage(n); alert(n); return false; }
		 */
		});
	});
}