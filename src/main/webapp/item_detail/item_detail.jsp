<%@ page import="com.ezen.index.service.ItemServiceImpl" %>
<%@ page import="com.ezen.index.service.ItemService" %>
<%@ page import="com.ezen.index.dto.Item" %>
<%@ page import="java.util.ArrayList" %><%-- 제품 상세 정보 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int categoryNumber = Integer.parseInt(request.getParameter("categoryNumber"));
    int itemNumber = Integer.parseInt(request.getParameter("itemNumber"));

    ItemService itemService = new ItemServiceImpl();
    Item item = itemService.itemDetail(categoryNumber, itemNumber);
    request.setAttribute("item", item);
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HAN ZO</title>

    <link rel="stylesheet" href="/css/item_detail.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://kit.fontawesome.com/89ab2ce88f.js" crossorigin="anonymous"></script>

</head>

<body>
<div id="wrapper">
    <!-- header start -->
    <jsp:include page="/module/header.jsp"/>
    <!-- header end -->
    <!-- nav start -->
    <jsp:include page="/module/nav.jsp"/>
    <!-- nav start -->


    <h2 id="mid_info" style="margin-top: 20px; margin-bottom: 20px">Product Info 제품상세</h2>


    <div class="item-detail-wrapper">

        <div class="item-img-info">
            <form>
                <div id="img_div" style="background-image:url(..${item.itemThumb}); width: 300px; height: 300px;"></div>

                <div class="item-detail-info">
                    <div class="item-detail-info-div"><strong>${item.itemName}</strong></div>
                    <div class="item-detail-info-div">${item.price}</div>
                    <div class="item-detail-info-div">${item.itemInfo}</div>

                    <span>사이즈 선택 : </span>
                    <select id="sizeSelect" name="size" style="margin-top: 20px">
                        <option>- 사이즈 선택 -</option>
                        <option value="230">230</option>
                        <option value="235">235</option>
                        <option value="240">240</option>
                        <option value="245">245</option>
                        <option value="250">250</option>
                        <option value="255">255</option>
                        <option value="260">260</option>
                        <option value="265">265</option>
                        <option value="270">270</option>
                        <option value="275">275</option>
                        <option value="280">280</option>
                        <option value="285">285</option>
                        <option value="290">290</option>
                        <option value="295">295</option>
                        <option value="300">300</option>
                    </select>
                </div>
            </form>
        </div>

        <script>
            document.getElementById('sizeSelect').addEventListener('change', function() {
                let selectedSize = this.value; // 선택된 사이즈 값 가져오기
                document.getElementById('size').value = selectedSize; // 숨겨진 인풋의 value를 업데이트
                document.getElementById('selectedSize').innerText = "선택된 사이즈: " + selectedSize; // 선택된 사이즈 표시 업데이트
            });
        </script>


        <div class="item_info" style="margin-top: 60px">
            <ul>
                <li>한조의 수제화는 자체공장에서 가공된 최고급 소재를 사용하며, 평균 제작기간은 약 12~14일이 소요됩니다.</li>
                <li>발 볼사이즈의 추가 사항은 문의 가능합니다.</li>
                <li>주문 후 생산되는 제품임으로 교환, 반품이 불가합니다.</li>
            </ul>
        </div>

        <div id="button_flex">
            <c:if>

            </c:if>
            <button id="payment_btn" style="width: 170px"><a
                    href="../payment/paymentComplete.jsp?itemNumber=${item.itemNumber}&itemCategory=${item.itemCategory}&itemPrice=${item.price}&userId=${loginMember.id}">바로결제</a>
            </button>
            <form class="needs-validation" action="/cart/cart-action.jsp" method="post">
                <input type="hidden" name="item" value="
                <% if (item != null) { %>
                    <%= item.getItemName() %>
                    <%= item.getPrice() %>
                <% } %>">
                <input type="hidden" id="size" name="size" value="size">
                <button id="cart_btn" style="width: 170px"><a>장바구니추가</a></button>
            </form>
        </div>
    </div>


    <p id="bottom_border"></p>

    <div id="bottom_flex">
        <button id="list_btn"><a href="/">계속 쇼핑하기</a></button>
        <button id="cart_move_btn"><a href="/cart/cart.jsp">장바구니 이동</a></button>
    </div>

    <%-- footer start --%>
    <jsp:include page="/module/footer.jsp"/>
    <%--    <%—- footer end -—%>--%>

</div>
</body>

</html>
