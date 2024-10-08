<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>동네26 - 일자리 정보 게시판</title>
<link rel="stylesheet" href="">
<style>
    /* General Page Layout */
	@media (min-width: 1000px) {
	  #page-wrapper {
	    margin: 0 150px 0 150px;
	    background-color: white;
	  }
	}
	
	#page-wrapper {
	    padding: 50px;
	    background-color: white;
	}
    
    body {
        background-color: #f5f5f5; /* Outer div background color */
    }
    
    .forh1 {
        font-size: 24px;
        margin-bottom: 20px;
        color: #333;
        text-align: center;
    }
    .backcolor {
    background-image: url(/resources/images/list_background.png);
    background-size: contain; /* 배경 이미지가 컨테이너에 맞게 조정됩니다 /
    background-repeat: no-repeat; / 이미지가 반복되지 않도록 설정 /
    background-position: center center; / 배경 이미지의 위치를 가운데로 설정 /
    padding: 80px 0; / 위아래 패딩 추가 /
    margin: 0 auto; / 가운데 정렬 */
    opacity: .7;
}
	.backcolor a{
		color: white;
	}
    .form-table select {
	    background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"%3E%3Cpath d="M7 10l5 5 5-5z"/%3E%3C/svg%3E') no-repeat right 10px center;
    	background-size: 20px;
    }
    .search-form {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-bottom: 20px;
    }
    .search-form .form-group {
        margin-right: 10px;
    }
    .search-form .form-group,
    .search-form .input-group {
        flex: 1;
    }
    .search-form .btn {
        flex: 0;
    }
    /*button style 수정*/
    .search-form button[type="submit"] {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    background-color: #5bc1ac;
	    color: white;
	    border: none; /* 수정: border 속성 설정 */
	    height: 38px;
	    font-size: 1rem;
	    padding: 0 2rem;
	    position: relative;
	    transition: background-color 0.15s ease-in-out;
	    white-space: nowrap; /* 수정: 텍스트 줄 바꿈 방지 */
	    box-sizing: border-box; /* 수정: 패딩 및 테두리 포함 계산 */
	    flex: 0;
    }
    .search-form button[type="submit"]:hover {
	    background: #4a9d8c;
	    color: white;
	}
    .search-container {
	    display: flex;
	    align-items: center; /* 세로 중앙 정렬 */
	    gap: 5px; /* 요소 사이의 간격 조절 */
	}
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    .job-title a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }
    .job-title a:hover {
        text-decoration: underline;
    }
    
    .pagination {
    display: flex;
    justify-content: center;
    list-style: none;
    padding: 0;
}

.pagination li {
    margin: 0; /* 페이지 선택 칸 사이의 간격 제거 */
}

.pagination li a {
    display: block;
    padding: 10px 15px;
    text-decoration: none;
    color: #5fb886; /* 텍스트 색상 */
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    transition: background-color 0.3s, color 0.3s;
}

.pagination li a:hover {
    background-color: #5bc1ac; /* 호버 색상 */
    color: #fff;
}

.pagination li.active a {
    color: #fff;
    background-color: #5bc1ac; /* 강조된 현재 페이지의 배경 색상 */
    border-color: #5bc1ac;
}

.pagination li.disabled a {
    color: #6c757d;
    pointer-events: none;
    background-color: #fff;
    border-color: #ddd;
}
    
    label{
        margin-right: 10px;
    }
    #district{
        width: 40%;
    }
    a{
        text-decoration: none;
    }
    
.form-group.input-group {
    display: flex;
    margin: 20px 0px 10px 5px;
    align-items: center;
    gap: 10px;
    position: relative;
    width: 200px;
}

.form-group.input-group label {
    margin-bottom: 10px;
    font-weight: bold;
    display: flex;
    align-items: center;
    white-space: nowrap;
    gap: 10px;
}

.form-group.input-group select {
    padding: 5px 30px 5px 10px;
    border: 1px solid #ddd;
    background-color: #fff;
    background: url('data:image/svg+xml,%3Csvg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"%3E%3Cpath d="M7 10l5 5 5-5z"/%3E%3C/svg%3E') no-repeat right 10px center;
    background-size: 20px;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    position: relative;
}

    .form-table {
        width: 100%;
        border-collapse: collapse;
    }
    .form-table th {
        background-color: #f2f2f2;
        text-align: left;
        padding: 10px;
    }
    .form-table td {
        padding: 10px;
    }
    h1{
        margin-right: 400px;
    }
    h2{
        margin-top: 50px;
    }
    #boardTable {
        border-left: none;
        border-right: none;
    }
    
    #boardTable th, #boardTable td {
        border-left: none;
        border-right: none;
    }
    
    .table-bordered th, .table-bordered td {
        border: 1px solid #dee2e6;
    }
    
    .table-bordered {
        border: 1px solid #dee2e6;
        border-left: none;
        border-right: none;
    }

	/*button style 수정*/
    .search-form button[type="submit"] {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #5bc1ac;
    color: white;
    border: none; /* 수정: border 속성 설정 */
    height: 38px;
    font-size: 1rem;
    padding: 0 2rem;
    position: relative;
    transition: background-color 0.15s ease-in-out;
    white-space: nowrap; /* 수정: 텍스트 줄 바꿈 방지 */
    box-sizing: border-box; /* 수정: 패딩 및 테두리 포함 계산 */
    flex: 0;
    }
    .search-form button[type="submit"]:hover {
    background: #4a9d8c;
    color: white;
}
    .search-container {
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
    gap: 5px; /* 요소 사이의 간격 조절 */
}
</style>



<!-- Header Start -->
<div class="backcolor">
    <div class="container text-center py-5" style="max-width: 900px;">
        <h3 class="text-white display-3 mb-4" style="color: #336B60;">일자리 정보 게시판</h3>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="../main">Home</a></li>
            <li class="breadcrumb-item"><a href="/job/list">일자리 정보 게시판</a></li>
        </ol>    
    </div>
</div>
<!-- Header End -->

</head>
<body>
    <div id="page-wrapper">
    	<div class="">
        <h1 class="forh1">채용정보 상세검색</h1>       
        <div class="search-form">
            <form id="searchForm" action="/job/list" method="get">
                <table class="form-table">
                    <tr>
                        <th>근무지</th>
                        <td>
                            <select id="district" class="form-control" name="district">
                                <option value="" ${pageMaker.cri.district == null ? "selected" : ""}>서울시 전체</option>
                                <option value="강남구" ${pageMaker.cri.district == "강남구" ? "selected" : ""}>강남구</option>
                                <option value="강동구" ${pageMaker.cri.district == "강동구" ? "selected" : ""}>강동구</option>
                                <option value="강북구" ${pageMaker.cri.district == "강북구" ? "selected" : ""}>강북구</option>
                                <option value="강서구" ${pageMaker.cri.district == "강서구" ? "selected" : ""}>강서구</option>
                                <option value="관악구" ${pageMaker.cri.district == "관악구" ? "selected" : ""}>관악구</option>
                                <option value="광진구" ${pageMaker.cri.district == "광진구" ? "selected" : ""}>광진구</option>
                                <option value="구로구" ${pageMaker.cri.district == "구로구" ? "selected" : ""}>구로구</option>
                                <option value="금천구" ${pageMaker.cri.district == "금천구" ? "selected" : ""}>금천구</option>
                                <option value="노원구" ${pageMaker.cri.district == "노원구" ? "selected" : ""}>노원구</option>
                                <option value="도봉구" ${pageMaker.cri.district == "도봉구" ? "selected" : ""}>도봉구</option>
                                <option value="동대문구" ${pageMaker.cri.district == "동대문구" ? "selected" : ""}>동대문구</option>
                                <option value="동작구" ${pageMaker.cri.district == "동작구" ? "selected" : ""}>동작구</option>
                                <option value="마포구" ${pageMaker.cri.district == "마포구" ? "selected" : ""}>마포구</option>
                                <option value="서대문구" ${pageMaker.cri.district == "서대문구" ? "selected" : ""}>서대문구</option>
                                <option value="서초구" ${pageMaker.cri.district == "서초구" ? "selected" : ""}>서초구</option>
                                <option value="성동구" ${pageMaker.cri.district == "성동구" ? "selected" : ""}>성동구</option>
                                <option value="성북구" ${pageMaker.cri.district == "성북구" ? "selected" : ""}>성북구</option>
                                <option value="송파구" ${pageMaker.cri.district == "송파구" ? "selected" : ""}>송파구</option>
                                <option value="양천구" ${pageMaker.cri.district == "양천구" ? "selected" : ""}>양천구</option>
                                <option value="영등포구" ${pageMaker.cri.district == "영등포구" ? "selected" : ""}>영등포구</option>
                                <option value="용산구" ${pageMaker.cri.district == "용산구" ? "selected" : ""}>용산구</option>
                                <option value="은평구" ${pageMaker.cri.district == "은평구" ? "selected" : ""}>은평구</option>
                                <option value="종로구" ${pageMaker.cri.district == "종로구" ? "selected" : ""}>종로구</option>
                                <option value="중구" ${pageMaker.cri.district == "중구" ? "selected" : ""}>중구</option>
                                <option value="중랑구" ${pageMaker.cri.district == "중랑구" ? "selected" : ""}>중랑구</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>급여</th>
                        <td>
                            <label><input type="radio" name="wageType" value="all" ${pageMaker.cri.wageType == "all" ? "checked" : ""}> 전체</label>
                            <label><input type="radio" name="wageType" value="hourly" ${pageMaker.cri.wageType == "hourly" ? "checked" : ""}> 시급</label>
                            <label><input type="radio" name="wageType" value="monthly" ${pageMaker.cri.wageType == "monthly" ? "checked" : ""}> 월급</label>
                            <label><input type="radio" name="wageType" value="annual" ${pageMaker.cri.wageType == "annual" ? "checked" : ""}> 연봉</label>
                        </td>
                    </tr>
                    <tr>
                        <th>학력</th>
                        <td>
                            <label><input type="radio" name="education" value="all" ${pageMaker.cri.education == "all" ? "checked" : ""}> 전체</label>
                            <label><input type="radio" name="education" value="high" ${pageMaker.cri.education == "high" ? "checked" : ""}> 고등학교</label>
                            <label><input type="radio" name="education" value="college" ${pageMaker.cri.education == "college" ? "checked" : ""}> 전문대학</label>
                            <label><input type="radio" name="education" value="univ" ${pageMaker.cri.education == "univ" ? "checked" : ""}> 대학_대학교</label>
                            <label><input type="radio" name="education" value="noEdu" ${pageMaker.cri.education == "noEdu" ? "checked" : ""}> 관계없음</label>
                        </td>
                    </tr>
                    <tr>
                        <th>경력</th>
                        <td>
                            <label><input type="radio" name="career" value="all" ${pageMaker.cri.career == "all" ? "checked" : ""}> 전체</label>
                            <label><input type="radio" name="career" value="entryLevel" ${pageMaker.cri.career == "entryLevel" ? "checked" : ""}> 신입</label>
                            <label><input type="radio" name="career" value="experienced" ${pageMaker.cri.career == "experienced" ? "checked" : ""}> 경력</label>
                            <label><input type="radio" name="career" value="noExperienceRequired" ${pageMaker.cri.career == "noExperienceRequired" ? "checked" : ""}> 무관</label>
                        </td>
                    </tr>
                    <tr>
                        <th>근무</th>
                        <td>
                            <label><input type="radio" name="workDay" value="all" ${pageMaker.cri.workDay == "all" ? "checked" : ""}> 전체</label>
                            <label><input type="radio" name="workDay" value="three" ${pageMaker.cri.workDay == "three" ? "checked" : ""}> 주3일</label>
                            <label><input type="radio" name="workDay" value="four" ${pageMaker.cri.workDay == "four" ? "checked" : ""}> 주4일</label>
                            <label><input type="radio" name="workDay" value="five" ${pageMaker.cri.workDay == "five" ? "checked" : ""}> 주5일</label>
                            <label><input type="radio" name="workDay" value="six" ${pageMaker.cri.workDay == "six" ? "checked" : ""}> 주6일</label>
                            <label><input type="radio" name="workDay" value="etc" ${pageMaker.cri.workDay == "etc" ? "checked" : ""}> 기타</label>
                        </td>
                    </tr>
                    <tr>
                        <th>키워드 검색</th>
                        <td>
                            <select id="searchType" class="form-control" name="type">
                                <option value="all" ${pageMaker.cri.type == "all" ? "selected" : ""}>전체</option>
                                <option value="cmpnyNm" ${pageMaker.cri.type == "cmpnyNm" ? "selected" : ""}>회사명</option>
                                <option value="joSj" ${pageMaker.cri.type == "joSj" ? "selected" : ""}>채용공고명</option>
                                <option value="dtyCn" ${pageMaker.cri.type == "dtyCn" ? "selected" : ""}>직무내용</option>
                            </select>
                            <div class="search-container">
	                            <input type="search" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
	                            <span class="input-group-btn">
	                                <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i> 검색</button>
	                            </span>
	                        </div>
                        </td>
                    </tr>
                </table>           
            </form>
        </div>

        <div class="form-group input-group">
            <label for="amount">게시글 갯수:</label>
            <select id="amount" name="amount" class="form-control">
                <option value="10" ${pageMaker.cri.amount == 10 ? "selected" : ""}>10</option>
                <option value="20" ${pageMaker.cri.amount == 20 ? "selected" : ""}>20</option>
                <option value="30" ${pageMaker.cri.amount == 30 ? "selected" : ""}>30</option>
            </select>
        </div>
        <!-- 
        <table id="boardTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>자치구</th>
                    <th>회사명</th>
                    <th>채용공고명/모집요강</th>
                    <th>근무시간</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
         -->
         <!-- /.row -->
            <div class="row">
                <div class="">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table id="boardTable" class="table table-hover">
                                    <thead>
					                    <tr>
						                    <th>자치구</th>
						                    <th>회사명</th>
						                    <th>채용공고명/모집요강</th>
						                    <th>근무시간</th>
						                    <th>등록일</th>
                						</tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
         	</div>
        <div class="d-flex justify-content-center">
            <ul class="pagination" id="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a href="#" data-page="${pageMaker.startPage - 1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                        <a href="#" class="${pageMaker.cri.pageNum == num ? 'current' : ''}" data-page="${num}">${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a href="#" data-page="${pageMaker.endPage + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <form id="pageForm" action="/job/list" method="get">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            <input type="hidden" name="type" value="${pageMaker.cri.type}">
            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
            <input type="hidden" name="district" value="${pageMaker.cri.district}">
            <input type="hidden" name="wageType" value="${pageMaker.cri.wageType}">
            <input type="hidden" name="career" value="${pageMaker.cri.career}">
            <input type="hidden" name="education" value="${pageMaker.cri.education}">
            <input type="hidden" name="workDay" value="${pageMaker.cri.workDay}">
        </form>
    </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            loadTable();
            console.log("전체 게시글 화면으로 이동");
            let result = '<c:out value="${result}"/>';
            console.log(result);
            
            $('#amount').on('change', function() {
                $('#pageForm').find("input[name='amount']").val($(this).val());
                $('#pageForm').find("input[name='pageNum']").val(1); // 페이지 번호를 1로 초기화
                $('#pageForm').submit();
            });
            
            function formatDate(dateString) {
                var date = new Date(dateString);
                var year = date.getFullYear();
                var month = ('0' + (date.getMonth() + 1)).slice(-2);
                var day = ('0' + date.getDate()).slice(-2);
                return year + '-' + month + '-' + day;
            }

            function loadTable() {
                $.ajax({
                    url: "/job/getList",
                    type: "POST",
                    data: {
                        pageNum: $("#pageForm").find("input[name='pageNum']").val(),
                        amount: $("#pageForm").find("input[name='amount']").val(),
                        type: $("#searchType").val(),
                        keyword: $("#searchForm").find("input[type='search']").val(),
                        district: $("#pageForm").find("input[name='district']").val(),
                        wageType: $("#pageForm").find("input[name='wageType']").val(),
                        career: $("#pageForm").find("input[name='career']").val(),
                        education: $("#pageForm").find("input[name='education']").val(),
                        workDay: $("#pageForm").find("input[name='workDay']").val(),
                    },
                    dataType: "json",
                    success: function(data) {
                        var boardTbody = $("#boardTable tbody"); // 테이블 본문(tbody) 요소 저장
                        boardTbody.empty(); // 테이블 본문을 비워서 기존 데이터를 삭제

                        if (data.list.length === 0) {
                            var noDataMessage = $("<tr>").append($("<td>").attr("colspan", 5).text("검색 결과가 없습니다."));
                            boardTbody.append(noDataMessage);
                        } else {
                            $.each(data.list, function(index, jobBoard) {
                                var row = $("<tr>"); // tr태그 생성

                                row.append($("<td>").text(jobBoard.mngrInsttNm)); // 자치구 추가
                                var companyName = $("<td>").text(jobBoard.cmpnyNm); // 기업명 추가
                                row.append(companyName);

                                var jobTitle = $("<td>");
                                var titleLink = $("<a>")
                                    .attr("href", "/job/detail?jobId=" + jobBoard.joRegistNo + 
                                        "&pageNum=" + $("#pageForm").find("input[name='pageNum']").val() + 
                                        "&amount=" + $("#pageForm").find("input[name='amount']").val() + 
                                        "&type=" + $("#searchType").val() + 
                                        "&keyword=" + $("#searchForm").find("input[type='search']").val() + 
                                        "&district=" + $("#pageForm").find("input[name='district']").val() + 
                                        "&wageType=" + $("#pageForm").find("input[name='wageType']").val() + 
                                        "&career=" + $("#pageForm").find("input[name='career']").val() + 
                                        "&education=" + $("#pageForm").find("input[name='education']").val() + 
                                        "&workDay=" + $("#pageForm").find("input[name='workDay']").val())
                                    .text(jobBoard.joSj);
                                jobTitle.append(titleLink);
                                jobTitle.append($("<div>").addClass("wage").text(jobBoard.hopeWage)); // 구인제목/모집요강 추가
                                row.append(jobTitle);

                                var holidayAndWorkTime = $("<td>").text(jobBoard.holidayNm + '(' + jobBoard.workTimeNm + ')');
                                row.append(holidayAndWorkTime);

                                var regDate = $("<td>").text(formatDate(jobBoard.joRegDt)); // 등록일/마감일 추가
                                row.append(regDate);

                                boardTbody.append(row); // 생성한 tr 요소를 테이블 본문에 추가
                            });
                        }
                        var wageType = $("#pageForm").find("input[name='wageType']").val();
                        if (!wageType) {
                            wageType = "all"; // 초기 값 설정
                        }
                        $('input[name="wageType"][value="' + wageType + '"]').prop('checked', true);

                        var education = $("#pageForm").find("input[name='education']").val();
                        if (!education) {
                            education = "all"; // 초기 값 설정
                        }
                        $('input[name="education"][value="' + education + '"]').prop('checked', true);

                        var career = $("#pageForm").find("input[name='career']").val();
                        if (!career) {
                            career = "all"; // 초기 값 설정
                        }
                        $('input[name="career"][value="' + career + '"]').prop('checked', true);

                        var workDay = $("#pageForm").find("input[name='workDay']").val();
                        if (!workDay) {
                            workDay = "all"; // 초기 값 설정
                        }
                        $('input[name="workDay"][value="' + workDay + '"]').prop('checked', true);
                        // 페이지네이션 업데이트
                        updatePagination(data.pageMaker);
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });
            }

            function updatePagination(pageMaker) {
                var paginationUl = $("#pagination");
                paginationUl.empty();

                if (pageMaker.prev) {
                    paginationUl.append('<li class="paginate_button previous"><a href="#" data-page="' + (pageMaker.startPage - 1) + '">Previous</a></li>');
                }

                for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
                    paginationUl.append('<li class="paginate_button ' + (pageMaker.cri.pageNum == i ? 'active' : '') + '"><a href="#" class="' + (pageMaker.cri.pageNum == i ? 'current' : '') + '" data-page="' + i + '">' + i + '</a></li>');
                }

                if (pageMaker.next) {
                    paginationUl.append('<li class="paginate_button next"><a href="#" data-page="' + (pageMaker.endPage + 1) + '">Next</a></li>');
                }

                $(".paginate_button a").on("click", function(e) {
                    e.preventDefault();
                    $("#pageForm").find("input[name='pageNum']").val($(this).attr("data-page"));
                    loadTable();
                });
            }

            // 자치구 선택 변경 시
            $("#district").on("change", function() {
                $("#pageForm").find("input[name='district']").val($(this).val());
                $("#pageForm").find("input[name='pageNum']").val(1); // 페이지 번호를 1로 설정
                $("#pageForm").submit();
            });
            
            // 희망급여 유형 선택 변경 시
            $("input[name='wageType']").on("change", function() {
                $("#pageForm").find("input[name='wageType']").val($(this).val());
                $("#pageForm").find("input[name='pageNum']").val(1);
                $("#pageForm").submit();
            });
            
            // 경력 유형 선택 변경 시
            $("input[name='career']").on("change", function() {
                $("#pageForm").find("input[name='career']").val($(this).val());
                $("#pageForm").find("input[name='pageNum']").val(1);
                $("#pageForm").submit();
            });
            
            // 학력 유형 선택 변경 시
            $("input[name='education']").on("change", function() {
                $("#pageForm").find("input[name='education']").val($(this).val());
                $("#pageForm").find("input[name='pageNum']").val(1);
                $("#pageForm").submit();
            });
            
            // 근무 유형 선택 변경 시
            $("input[name='workDay']").on("change", function() {
                $("#pageForm").find("input[name='workDay']").val($(this).val());
                $("#pageForm").find("input[name='pageNum']").val(1);
                $("#pageForm").submit();
            });              
        });
    </script>
<!-- Footer -->
<%@include file="../includes/footer.jsp"%>