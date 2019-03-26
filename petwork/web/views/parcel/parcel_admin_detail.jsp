<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.petwork.model.vo.*,java.util.List" %>	
<%
	ParcelAniView p = (ParcelAniView)request.getAttribute("parcel");
	Member m = (Member)request.getAttribute("member");
	List<ParcelImg> list = (List)request.getAttribute("list");
	ParcelImg parcelImg = (ParcelImg)request.getAttribute("pImg");
	int price = (int)request.getAttribute("price");

%>	
<script>
	function fn_complete(){
		 alert("분양완료 하시겠습니까?")
		 var postNo = $('input[name=postNo]').val();
		 location.href="<%=request.getContextPath()%>/ParcelComplete?postNo="+postNo;
	}
	 function fn_rewrite(){
		 var postNo = $('input[name=postNo]').val();
		 location.href="<%=request.getContextPath()%>/ParcelRewrite?postNo="+postNo;
	 }
</script>
<%@ include file="/views/common/header.jsp"%>
<section id="section">
	<div class='container-fluid'>
        <div class='row'>
            	<div class='col-md-2' id='nav'>
		    <div class="nav-side-menu">
		        <div class="brand">PETWORK</div>
		        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
		        <div class="menu-list">
		            <ul id="menu-content" class="menu-content collapse out">
		                <li>
		                    <a href="<%=request.getContextPath()%>/intoAdminmain"> HOME </a>
		                </li>
		                <li>
		                    <a href="<%= request.getContextPath()%>/adminmemberlistcontroller"> 회원관리 </a>
		            
		                </li>
		                <li>
		                    <a href="<%= request.getContextPath()%>/adminpetlistcontroller"> 동물관리 </a>
		                </li>
		                  <li data-toggle="collapse" data-target="#doctor" class="collapsed">
		                    <a href="#"> 수의사 관리 ▼ </a>
		                </li>
		                <ul class="sub-menu collapse" id="doctor">
		                    <li><a href="<%=request.getContextPath()%>/views/doctor_regist/doctorRegist.jsp">수의사 등록</a></li>
		                     <li><a href="<%=request.getContextPath()%>/doctor/doctorShow">수의사 명단</a></li>
		                </ul>
		                <li data-toggle="collapse" data-target="#board" class="collapsed">
		                    <a href="#"> 게시판 관리 ▼ </a>
		                </li>
		                <ul class="sub-menu collapse" id="board">
		                    <li><a href="<%=request.getContextPath()%>/board/freeBoardList">자유게시판</a></li>
		                    <li><a href="<%=request.getContextPath()%>/board/sharingBoardList">나눔게시판</a></li>
		                    <li><a href="<%=request.getContextPath()%>/parcelMain">분양게시판</a></li>
		                </ul>
						<li data-toggle="collapse" data-target="#missing"
							class="collapsed"><a href="#"> 실종/보호 관리 ▼ </a></li>
						<ul class="sub-menu collapse" id="missing">
							<li><a
								href="<%=request.getContextPath()%>/missingPet/findPostList?adminMode=true">찾아주세요</a></li>
							<li><a
								href="<%=request.getContextPath()%>/missingPet/protectPostList?adminMode=true">보호중입니다</a></li>
						</ul>
						<li data-toggle="collapse" data-target="#advice" class="collapsed">
		                    <a href="#"><span>문의 관리 ▼ </span></a>
		                </li>
		                <ul class="sub-menu collapse" id="advice">
		                    <li><a href="<%=request.getContextPath()%>/faq/faqList">FAQ</a></li>
		                </ul>
		            </ul>
		        </div>
		    </div>
		</div>
            <div class='col-md-10' id='section'> 
                <div class="card">
                    <div class="row">
                        <div class="col-md-5 border-right">
                            <div class="gallery-wrap"> 
                                <div class="img-big-wrap">
                                    <div class="team-img"> 
                                        <img src="<%=request.getContextPath()%>/views/upload/parcel/<%=parcelImg.getParcelImgAddress() %>"/>
                                    </div>
                                </div>
                                <div class="img-small-wrap">
                                	<%for(ParcelImg pImg : list) {%>
	                                    <div class="item-gallery"> 
											<img src="<%=request.getContextPath()%>/views/upload/parcel/<%=pImg.getParcelImgAddress() %>"/>
	                                    </div>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body p-5">
                            	<div class="row">
                            		<div class="col-md-12">
                               			<h5><%=p.getTitle() %></h5>
                               		</div>
                            	</div>
                            	<div class="row">
                            		<div class="col-md-12">
	                                    <span class="price h3 text-warning"> 
	                                        <span class="num"><%=price %>만원</span>
	                                    </span>  
		                        	</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <dl class="parcel-data">
                                            <dt>지역</dt>
                                            <dd><p><%=p.getAddress() %></p></dd>
                                        </dl>
                                    </div>
                                    <div class="col-md-6">
                                        <dl class="parcel-data">
                                            <dt>생일</dt>
											<dd><%=p.getPetBirth() %></dd>
                                        </dl>
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <dl class="parcel-data">
                                            <dt>동물</dt>
                                            <dd><%=p.getRaceName() %></dd>
                                        </dl>
                                    </div>
                                    <div class="col-md-6">
                                        <dl class="parcel-data">
                                            <dt>종</dt>
                                            <dd><%=p.getAnimalName() %></dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <dl class="parcel-data">
                                            <dt>성별</dt>
                                            <dd>
                                            	<%if(p.getGender().equals("M")){%>
                                            		♂
                                            	<%} else {%>
                                            		♀
                                            	<%} %>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="col-md-6">
                                        <dl class="parcel-data">
                                            <dt>중성화</dt>
                                            <dd>
                                            	<%if(p.getNeutering().equals("Y")){%>
                                            		O
                                            	<%} else {%>
                                            		X
                                            	<%} %>
                                            </dd>
                                        </dl>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <dl class="parcel-data">
                                            <dt>연락처</dt>
                                            <%if(p.getPostYn().equals("Y")) {%>
                                            	<dd>***********</dd>
                                            <%} else { %>
                                            	<dd><%=m.getPhone() %></dd>
                                            <%} %>
                                        </dl>
                                    </div>                               
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <dl class="parcel-data">
                                            <dt>예방접종</dt>
                                            <%if(p.getVaccination()!=null) {%>
                                            	<dd><%=p.getVaccination() %></dd>
                                            <%} else{%>
                                            	<dd>없음.</dd>
                                            <%} %>
                                        </dl>
                                    </div>                               
                                </div>
                            </div> 
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-md-12">
                    	<hr>
                    		<div class="row">
                    			<div class="col-md-1"></div>
                    			<div class="col-md-10">
		                            <p id="parcel-content"><%=p.getContent() %></p>
		                        </div>
				  			<div class="col-md-1"></div>
                            </div>
                            <hr>
                            <div class="row" id="parcel-detail-btn">
                            	<div class="col-md-1"></div>
                            	<div class="col-md-4">
                            		<p id="parcel-write-date"><%=p.getPostDate() %></p>
                            	</div>
                            	<%if(loginMember!=null&&(loginMember.getId()!=null||loginMember.getAdminYN()=='Y')) {%>						
	                            	<div class="col-md-2">
	                            		<%if(p.getPostYn().equals("Y")) {%>
	                            			
	                            		<%} else { %>
	                            			<button class="btn btn-primary" id="parcel-complete" onclick="fn_complete();">분양완료</button>
	                            		<%} %>
	                            	</div>
	                            	<div class="col-md-2">
	                            		<button class="btn btn-primary" id="parcel-rewrite" onclick="fn_rewrite();">수정</button>
	                            	</div>
	                            	<div class="col-md-2">
		                            	<form action="<%=request.getContextPath()%>/parcelDelete" method="post">
		                            		<input type="submit" class="btn btn-primary" id="parcel-delete" value="삭제">
											<input type="hidden" name="postNo" id="postNo" value="<%=p.getPostNo()%>">
		                            		<input type="hidden" name="parcelImg1" value="<%=parcelImg.getParcelImgAddress()%>">
		                            		<%for(int i = 0; i < list.size(); i++) {%>
		                            			<input type="hidden" name="parcelImg<%=i+2%>" value="<%=list.get(i).getParcelImgAddress()%>">
		                            		<%} %>
		                            	</form>
	                            	</div>
                            	<%} %>
                            	<div class="col-md-1"></div>
                            </div>
                    	</div>
                    </div>
                </div>
            </div>

        </div>
    </div> 
</section>

<%@ include file="/views/common/footer.jsp"%>