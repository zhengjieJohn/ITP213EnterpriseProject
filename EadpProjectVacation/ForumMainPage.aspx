<%@ Page Title="" Language="C#" MasterPageFile="~/Testing.Master" AutoEventWireup="true" CodeBehind="ForumMainPage.aspx.cs" Inherits="EadpProjectVacation.Models.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headforum" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PageNameForum" runat="server">

    <asp:ListView ID="ListView1" runat="server">   
        <LayoutTemplate>
            <div runat="server" id="lstProducts">
                <div runat="server" id="itemPlaceholder">
                </div>
            </div>
            <asp:DataPager runat="server" PageSize="5" >
            <Fields>
                <asp:NextPreviousPagerField 
                ButtonType="Button"
                ShowFirstPageButton="True" 
                ShowLastPageButton="True" />
            </Fields>
            </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <asp:Image ID="ProductImage" runat="server"
            ImageUrl='<%# "~/images/thumbnails/" + Eval("ThumbnailPhotoFileName") %>' />	        
            <div class="plainBox" runat="server">
                <asp:HyperLink ID="ProductLink" runat="server" Text='<%# Eval("Name") %>' 
                NavigateUrl='<%# "ProductDetails.aspx?productID=" + Eval("ProductID") %>' />
                <br /><br />
                <b>Price:</b> 
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("ListPrice", "{0:c}")%>' /> <br />
            </div>
            <br />
        </ItemTemplate>
    </asp:ListView>

    <%--<div class="container">
        <div class="row">
            <div class="col-lg-12 paginationBar forumModule forumMargin">
                <a href="#">Home</a><i class ="fas fa-chevron-circle-right paginationArrow"></i>
                <!-- comment
                    <a href="#">Category</a><i class="fas fa-chevron-circle-right paginationArrow"></i>
                    <a href="#">Discussion</a>
                    -->
            </div>      
        </div>

        <div class="row forumModule">
            <div class="col-lg-12">
                <div class="pull-left">
                    <h1 style="font-size:1.7em">Category Name</h1>
                </div>
                <div class="pull-right">
                    <a class="btn btn-primary themeButton" href="#">Start Discussion</a>
                </div>
             </div>
        </div>  

        <div class="row forumModule forumPad">
            <table class="forumTable">
                <tr class="forumModule">
                    <th>
                        Discussion
                    </th>
                    <th>
                        Author
                    </th>
                    <th >
                        Replies
                    </th>
                </tr>
                <tr>
                    <td>
                        <a href="#">Discussion name here</a>
                    </td>
                    <td>
                        <a href="#">Author</a>
                    </td>
                    <td>
                        <a href="#">27 Replies</a>
                    </td>
                </tr>
            </table>
        </div>
    </div><!--end of container/zj foru-->--%>
</asp:Content>

