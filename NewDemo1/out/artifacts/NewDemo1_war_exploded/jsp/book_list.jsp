<%@ page import="java.util.List" %>
<%@ page import="com.entity.Book" %>
<%@ page import="com.util.WebUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>图书列表</title>
</head>
<body>

<%= WebUtil.popSessionMsg(request) %>

<form action="/book/del" method="post">
    <table class="table table-striped">
        <tr>
            <th><input type="checkbox" onclick="alls(this)"></th>
            <th>id</th>
            <th>书名</th>
            <th>价格</th>
            <th>作者</th>
            <th>出版社</th>
            <th>其他</th>
        </tr>
        <c:forEach items="${books}" var="books" >
        <tr>
            <td><input name="id"  value="${books.id}" type="checkbox"></td>
            <td>${books.id}
            </td>
            <td><a href="/book/detail?id=${books.id}"> ${books.name}
            </a></td>
            <td>${books.price}
            </td>
            <td>${books.author}
            </td>
            <td>${books.press}
            </td>
            <td>
                <a href="/book/del?id=${books.id}" class="btn btn-primary">删除</a>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-id="${books.id}"  data-toggle="modal" data-target="#myModal">
                    更新
                </button>

            </td>
        </tr>
        </c:forEach>
    </table>
    <div style="margin-top: 2em;">
        <input type="submit" value="批量删除" class="btn btn-success">
    </div>

</form>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">书籍信息更新</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/book/update" method="post">
                <%--更新表单--%>
                <div class="modal-body" style="height: 400px">
                   <div class="form-group">
                        <label for="IdA">书籍编号</label>
                        <input type="text" class="form-control" id="IdA" name="IdB" aria-describedby="emailHelp" readonly="readonly" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="Name">书籍名称</label>
                        <input type="text" class="form-control" name="name" id="Name" aria-describedby="emailHelp" placeholder="请输入书籍名称">
                    </div>
                    <div class="form-group">
                        <label for="price">书籍价格</label>
                        <input type="number" class="form-control" step="0.001" name="price" id="price" aria-describedby="emailHelp" value="0.002" placeholder="请输入书籍价格">
                    </div>
                    <div class="form-group">
                        <label for="author">书籍作者</label>
                        <input type="text" class="form-control"  name="author" id="author" aria-describedby="emailHelp" placeholder="请输入书籍作者">
                    </div>
                    <div class="form-group">
                        <label for="press">书籍出版社</label>
                        <input type="text" class="form-control" name="press" id="press" aria-describedby="emailHelp" placeholder="请输入书籍出版社">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">更新</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    function alls(e) {
        var checkboxs = document.getElementsByName("id");
        for (var i = 0; i < checkboxs.length; i++) {
            checkboxs[i].checked = e.checked
        }
    }

    $("#myModal").on('show.bs.modal',function (e) {
        var x = event.target;
        var id = $(x).attr("data-id");
        $.get("/book/GetBook?id="+id,function (text) {
            $("#IdA").val(text.id);
            $("#Name").val(text.name);
            $("#price").val(text.price);
            $("#author").val(text.author);
            $("#press").val(text.press);
        })
        
    });

    // function update(x){
    //     var tr = x.parentNode.parentNode;
    //     var tds = tr.getElementsByTagName("td");
    //     var id = tds[1].childNodes[0].nodeValue;
    //     var name = tds[2].childNodes[0].childNodes[0].nodeValue;
    //     var price = tds[3].childNodes[0].nodeValue;
    //     var author = tds[4].childNodes[0].nodeValue;
    //     var press = tds[5].childNodes[0].nodeValue;
    //     //alert(id +":"+name +":"+price+":"+author+":"+press);
    //

    // }

    document.querySelector("#booklist").classList.add("active");
</script>
</body>
</html>
