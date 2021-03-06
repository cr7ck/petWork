<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.petwork.model.vo.SharingPost, com.petwork.model.vo.SharingComment" %>
<%
	List<SharingPost> list = (List)request.getAttribute("list");
	List<SharingComment> commentList=(List)request.getAttribute("comments");
%>
<%@ include file="/views/common/header.jsp" %>

<!-- --------------------------------------상세페이지 화면----------------------------------- -->

<section>
   <div class="container-fluid">
   <div class="row"  id="contents">
      <div class='col-md-2' id='nav'>
		    <div class="nav-side-menu">
		        <div class="brand">PETWORK</div>
		        <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
		        <div class="menu-list">
		            <ul id="menu-content" class="menu-content collapse out">
		                <li>
		                    <a href="<%=request.getContextPath()%>/indexcontroller"> HOME </a>
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
		                    <li><a href="<%=request.getContextPath()%>/qna/qnaList">QnA</a></li>
		                    <li><a href="<%=request.getContextPath()%>/faq/faqList">FAQ</a></li>
		                </ul>
		            </ul>
		        </div>
		    </div>
		</div>

            <div class='col-md-10' id='section'>
                <!-- 관리자 자유게시판 상세페이지 -->
				<div class="row">
					<div class="col-md-12" id="post-detail-date">
						<span id="date"><%=list.get(0).getSharingPostDate() %></span>
					</div>
				</div>

                <div class="row">
					<div class="col-md-12">
						<table class="table table-protocol table-bordered" id="post-detail-tbl">
							<tbody>
								<tr>
									<th>작성자</th>
									<td><span id="member-id"><%=list.get(0).getSharingPostWriter() %></span></td>
								</tr>

								<tr>
									<th>제목</th>
									<td><span id="sharing-post-detail-write-title-input"><%=list.get(0).getSharingPostTitle() %></span></td>
								</tr>
								<%if(!list.get(0).getSharingPostWriter().startsWith("admin")) {%>
								<tr>
									<th>상품종류</th>
									<td><span id="product"><%=list.get(0).getProductCategoryName() %></span></td>
								</tr>
								<%} %>
								<tr>
									<th>거래장소</th>
									<td><span id="sharingAddress"><%=list.get(0).getSharingPostAddress() %></span></td>
								</tr>
								<%if(!list.get(0).getSharingPostWriter().startsWith("admin")) {%>		
								<tr>
									<th>거래여부</th>
									<td><span id="postYN"><%=list.get(0).getSharingPostYN() %></span></td>
								</tr>
								<%} %>			
								<tr>
									<th>내용</th>
									<td>
										<span>
										<%if(!list.isEmpty()) {%>
											<%for(SharingPost sharingPost : list) {%>
											<%if(sharingPost.getSharingPostWriter().contains("admin")) {%>
												<img id="post-detail-img-admin"	src="<%=request.getContextPath() %>/views/upload/board/<%=sharingPost.getSharingImgAddress() %>">
											<%} else { %>
												<img id="post-detail-write-img"	src="<%=request.getContextPath() %>/views/upload/board/<%=sharingPost.getSharingImgAddress() %>">
											<%}
											}
										} %>
										</span>
										<textarea id="post-data-role-body" class="form-control mt-2" rows="5" cols="95" readonly><%=list.get(0).getSharingPostContent() %></textarea>
									</td>
								</tr>
								
							</tbody>
						</table>
						
					</div>
				</div>
				<%if(loginMember.getAdminYN()=='Y'||loginMember.getId().equals(list.get(0).getSharingPostWriter())) {%>
				<div class="row mt-2">
					<div class="col-md-8"></div>
					<div class="col-md-2">
						<div id="post-detail-update">
							<input class="btn btn-primary" id="update" type="submit" value="수정하기" onclick="sharingPostUpdate();">
						</div>
					</div>
					<div class="col-md-2">
						<input class="btn btn-primary" id="delete" type="button" value="삭제하기" onclick="fn_deleteSharingPost();">
					</div>
				</div>
				<%} %>
			    
                <form action="<%=request.getContextPath()%>/board/sharingBoardDelete?loginMember=<%=loginMember.getId() %>" method="post" name="deleteFrm">
					<input type="hidden" name="sharingPostNo" value="<%=list.get(0).getSharingPostNo() %>"/>
					<%for(int i=0; i<list.size(); i++){ %>
					<input type="hidden" name="sharingPostImg<%=i %>" value="<%=list.get(i).getSharingImgAddress() %>"/>	
					<%} %>
				</form>
				<hr />
				<script>
					function sharingPostUpdate(){
						location.href="<%=request.getContextPath()%>/board/sharingBoardUpdate?sharingPostNo=<%=list.get(0).getSharingPostNo()%>";
					};
					
					function fn_deleteSharingPost(){
						if(!confirm("게시글을 삭제하시겠습니까?")){
							return;
						}
						$('[name=deleteFrm]').submit();
					};
										
				</script>

                <hr />

                <!-- 댓글 달기 -->
				<div class="row mb-2">
					<div class="col-md-12 comment-editor">
						<form class="form-inline mb-2" id="post-comment-frm" action="<%=request.getContextPath()%>/board/sharingCommentInsert" name="postCommentFrm" method="post">
							<!-- 게시판 번호 -->
							<input type="hidden" name="sharingPostNo" value="<%=list.get(0).getSharingPostNo()%>"/>
							<!-- 게시판 댓글작성자 -->
							<input type="hidden" name="sharingCommentWriter" value="<%=loginMember.getId()%>"/>
							<!-- 댓글 레벨 -->
							<input type="hidden" name="sharingCommentLevel" value="1"/>
							<!-- 댓글 참조번호 -->
							<input type="hidden" name="sharingCommentRef" value="0"/>
							<label for="postComment">Comment&nbsp;&nbsp;</label>
							<input type="text" placeholder="댓글을 입력해주세요" class="form-control" id="postComment" name="sharingCommentContent"/>&nbsp;
							<button type="submit" class="btn btn-primary" id="btn-insert">댓글등록</button>
						</form>
					</div>
				</div>
				
				<hr/>
				
                <!-- 댓글 달았을 때 나오는 폼 -->
				<table class="tbl-comment">
				<%if(commentList!=null){ 
					for(SharingComment sc : commentList){
						if(sc.getSharingCommentLevel()==1){
				%>
		         <tr>
		            <td>
		               <sub class="comment-writer"><%=sc.getSharingCommentWriter()%></sub>
		               <sub class="comment-date"><%=sc.getSharingCommentDate()%></sub>
		               <br/>
		               <span id="commentContent"><%=sc.getSharingCommentContent() %></span>
		            </td>
		            <td>
		               <button class="btn-reply btn btn-primary reply-btn" value="<%=sc.getSharingCommentNo() %>">답글</button>
		            <%if(loginMember.getId()!=null){%>
		               <%if(loginMember.getId().equals(sc.getSharingCommentWriter())||loginMember.getAdminYN()=='Y') {%>
		               		<button class="btn-delete btn reply-btn" id="sharingCommentDelete" name="sharingCommentDelete" value="<%=sc.getSharingCommentNo() %>">삭제</button>
		               <%} %>
		            </td>
		            <%} %>
		         </tr>
		      <%}else {%>
		         <tr class='level2'>
		            <td id="leve2Comment">
		               <sub class="comment-writer"><%=sc.getSharingCommentWriter()%></sub>
		               <sub class="comment-date"><%=sc.getSharingCommentDate()%></sub>
		               <br/>
		               <span id="commentContent"><%=sc.getSharingCommentContent() %></span>
		            </td>
		            <td>
		               
		            </td>
		         </tr>
		         <%}
		         }
		      }%>
		      </table>
		      <script>
				
					//답글 이벤트
					$('.btn-reply').on('click',function(e){
					<%if(loginMember!=null){%>
					var tr=$('<tr></tr>');
					var html="<td style='display:none text-align:left;' colspan='2'>"; 
					html+="<form class='form-inline mb-2' action='<%=request.getContextPath()%>/board/sharingCommentInsert' method='post'>";
					html+="<input type='hidden' name='sharingPostNo' value='<%=list.get(0).getSharingPostNo()%>'/>";
					html+="<input type='hidden' name='sharingCommentWriter' value='<%=loginMember.getId()%>'/>";
					html+="<input type='hidden' name='sharingCommentLevel' value='2'/>";
					html+="<input type='hidden' name='sharingCommentRef' value='"+$(this).val()+"'/>";
					html+="<input class='form-control' id='postComment' type='text' placeholder='Comment' id='userPostComment' name='sharingCommentContent'/>&nbsp;";
					html+="<button type='submit' class='btn-insert2 btn btn-primary'>댓글등록</button>";
					html+="</form></td>";
					tr.html(html);
					tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
					$(this).off('click');
					tr.find('form').submit(function(e){
						if(<%=loginMember==null%>){
							fn_loginAlert();
							e.preventDefault();
							return;
						}
						var len=$(this).children($('input[name=sharingCommentContent]')).val().trim().length;
						if(len==0){
							e.preventDefault();
						}
					});
					tr.find($('input[name=sharingCommentContent]')).focus();
					<%}%>
					});
				
					$(function(){
						$('button[name=sharingCommentDelete]').on("click",function(e){
							if(!confirm("댓글 삭제 하시겠습니까?")){
								return;
							}
							
							/* del은 현재 보는 커멘트 숫자 commentNo이다 */
							location.href="<%=request.getContextPath()%>/board/sharingCommentDelete?sharingPostNo=<%=list.get(0).getSharingPostNo() %>&del="+$(this).val();

						});
					});
					
					$('#sharingComment').focus(function(){
						if(<%=loginMember.getId()==null%>){
							fn_loginAlert();
						}
					});
					
					$('[name=postCommentFrm]').submit(function (e){
						if(<%=loginMember.getId()==null%>){
							fn_loginAlert();
							e.preventDefault();
							return;
						}
						var len = $('input[name=sharingCommentContent]').val().trim().length;
						if(len == 0){
							alert('내용을 입력하세요');
							e.preventDefault();
							$('#sharingComment').focus();
						}
					});
					
					function fn_loginAlert(){
						alert('로그인 후 이용가능 합니다.');
					};

				</script>
            </div>


        </div>
    </div>

</section>

<%@ include file="/views/common/footer.jsp" %>