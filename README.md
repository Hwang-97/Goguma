# 고구마켓

![https://user-images.githubusercontent.com/85034286/152821259-f567690c-ef0c-4a1a-b8ff-4288e81c61bb.png](https://user-images.githubusercontent.com/85034286/152821259-f567690c-ef0c-4a1a-b8ff-4288e81c61bb.png)

### 3-1. 고구마켓의 메인 페이지 입니다.

- 상품검색 , 추천 , 회원가입 , 로그인 , 회원관리 , 관리자 페이지 등 전반적인 모든 기능을 구현하였습니다.
- 상품 등록 및 구매시 경매 여부를 선택할 수 있게 하여 경쟁력을 높인 사이트 입니다.

<br />
<br />
<br />

# 🙋 My Role

### 1. 담당 업무

![https://user-images.githubusercontent.com/85034286/152822585-b4961b35-3f30-434d-bd51-b8737c1729e5.png](https://user-images.githubusercontent.com/85034286/152822585-b4961b35-3f30-434d-bd51-b8737c1729e5.png)

### 1-1. 주요 특징

- 회원 정보중 프로필 관련 정보를 수정 가능하도록 UI 와 기능을 구현하였습니다.
- ![프로필 수정](https://user-images.githubusercontent.com/85034286/152829943-d637978c-ce67-4524-8f7f-9102d5516c2c.gif)
- 👆프로필을 수정 기능을 구현하였습니다.

### 1-2. 주요 특징

- 회원 정보중 특정 정보를 제외한 모든 정보를 수정 가능하도록 UI 와 기능을 구현하였습니다.
- ![개인정보 수정](https://user-images.githubusercontent.com/85034286/152832634-778b71fb-0f60-49a2-af3c-3c488195c063.gif)
- 👆회원 정보 수정 기능을 구현하였습니다.

<br />
<br />

### 2. 담당 업무

![image](https://user-images.githubusercontent.com/85034286/152835322-492babc0-6459-49a9-ba9b-58d0d6c278f4.png)

### 2-1. 주요 특징

- 본인이 작성한 게시글이나 받은 후기등을 모두 확인 가능하도록 구현하였습니다.
- ![전체적인 게시판 기능](https://user-images.githubusercontent.com/85034286/152835564-914e6962-fcd7-4439-b1e7-fade0da0e201.gif)
- 👆다른 페이지 들의 거이 모든 기능과 연동시켰습니다.

<br />
<br />
<br />

DAO와 DTO 그리고 서블릿을 구별하여 체계적으로 구현하였습니다.
<br />
![image](https://user-images.githubusercontent.com/85034286/152840192-f9cfe225-387f-4de8-8b7b-ac99cc249ddd.png)

<br />
<br />
<br />

# 🔎 Detail

### 1. 주요 코드

- 프로필 변경시 썸네일을 출력하는 JavaScript 코드 입니다.
    
    ```
    <script>
	
	function setThumbnail(event){
		var reader = new FileReader();
		
		reader.onload = function(event){
			$("#profilImg").attr("src", event.target.result);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	</script>
    
    ```
    
- 프로필을 수정시 데이터를 받아 DAO에 넘겨 DB값을 수정하는 코드 입니다.
    
    ```
    MultipartRequest  multi = new MultipartRequest(
	                                 req,
	                                 "C:\\Goguma\\Goguma\\src\\main\\webapp\\files\\profile",
	                                 1024 * 1024 * 100,
	                                 "UTF-8",
	                                 new DefaultFileRenamePolicy()
	                            );
	         String id = (String)req.getSession().getAttribute("id");
	         String nickName = multi.getParameter("nickName");
	         String intro = multi.getParameter("intro");
	         
	         String path = multi.getFilesystemName("pathDir");
	         
	         if(nickName==null) nickName = (String)req.getSession().getAttribute("nickname");
	         if(nickName==null) intro = " ";
	         if(nickName==null) path = "default image.jpg";
	         
	         
	         HashMap<String,String> map = new HashMap<String,String>();
	         
	         map.put("id", id);
	         map.put("intro", intro);
	         map.put("nickName", nickName);
	         map.put("path", path);
	         
	         int check = dao.setProfile(map);
	         
	         System.out.println(check); // 나중에 처리
	 		 System.out.println(path);
	 		 System.out.println(id);
	 		 
	 		 req.setAttribute("check", check);
	 		 req.setAttribute("nickName", nickName);
	 		 
	 		 req.getSession().setAttribute("nickname", nickName);
    
    ```
    
- jstl 을 사용하여 회원의 프로필에 맨트를 지정하는 코드입니다.
    
    ```
   <div class="salesAvg">
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <!-- jquery 이횽해서 자식 위치 확인후  색을 지정  -->
        <c:if test="${score.salesCnt<=3}">
        <div>초보 고구마</div>
        </c:if>
        <c:if test="${score.salesCnt>3}">
        <div>중급 고구마</div>
        </c:if>
        <c:if test="${score.salesCnt>5}">
        <div>고급 고구마</div>
        </c:if>
    </div>
    <div class="purchaseAvg">
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <span class="fa fa-star"></span>
        <c:if test="${score.purchaseCnt<=3}">
        <div>초보 고구마</div>
        </c:if>
        <c:if test="${score.purchaseCnt>3}">
        <div>중급 고구마</div>
        </c:if>
        <c:if test="${score.purchaseCnt>5}">
        <div>고급 고구마</div>
        </c:if>
    </div>
    
    ```
    

<br />
<br />

### 2. 주요 코드

- DAO에서 전달받은 데이터를 기준으로 페이징 버튼을 구현하는 메소드 입니다.
    
    ```
    private String getPagebar() {
		int totalCount = 0;
		int totalPage = 0;
		int blockSize = 10;
		int n;
		int loop;
		System.out.println(map.toString());
		totalCount = dao.getMyProductTotalPage(map);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);

		String pagebar = "";
		
		loop = 1; 
		n = ((nowPage - 1) / blockSize) * blockSize + 1; 
		
		pagebar += "<nav><ul class=\"pagination\">";

		if (n == 1) {
			pagebar += String.format("<li class='nothing'><a href='#!' aria-label='Previous'><span class='glyphicon glyphicon-menu-left'></span></a></li>");
		} else {
			pagebar += String.format("<li class='previous'><a href='/goguma/profile/mycommunitylist.do?page=%d' aria-label='Previous'><span class='glyphicon        glyphicon-menu-left'></span></a></li>", n-1);
		}

		while (!(loop > blockSize || n > totalPage)) {
			if (n == nowPage) {
				pagebar += String.format("<li class='active'><a href='#!'>%d</a></li>", n);
			} else {
				pagebar += String.format("<li><a href='/goguma/profile/mycommunitylist.do?page=%d'>%d</a></li>", n, n);
			}			
			loop++;
			n++;
		}

		if (n > totalPage) {
			pagebar += String.format("<li class='nothing'><a href='#!' aria-label='Next'><span class='glyphicon glyphicon-menu-right'></span></a></li>");
		} else {
			pagebar += String.format("<li class='next'><a href='/goguma/profile/mycommunitylist.do?page=%d' aria-label='Next'><span class='glyphicon glyphicon-menu-right'></span></a></li>", n);
		}

		pagebar += "</ul></nav>";
		return pagebar;
	}
    
    ```
    
- 트리거를 만들어 테이블을 굳이 수정하지 않고 기능을 구현하였습니다.
    
    ```
    create or replace Trigger Trgreview
    after insert on tbldeal
    for each row
    begin
        insert into tblReview values ('S',:NEW.deal_seq, 10,'null');
        insert into tblReview values ('B',:NEW.deal_seq, 10,'null');
    commit;
    end;
    
    ```
    

<br />
<br />
<br />

# 💡 Review

### 1. 후기

- 첫 웹 프로젝트를 진행하면서 웹 디자인과 백엔드 구현에 더욱 자신감을 갖게 되었고, 현재 어떤 사이트든 제작할 자신이 있습니다.
- 저희는 깃허브를 이용해 협업을 진행하였습니다. 협업을 진행하며 깃 플로우와 커밋 시기 등을 확실하게 정하면 좋겠다고 생각하였고, 
  다음 프로젝트는 협업툴의 기능을 최대한 끌어올릴 것입니다.

<br />
<br />
<br />
