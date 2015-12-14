<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="gioi-thieu.aspx.cs" Inherits="gioi_thieu" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnGioiThieu" runat="server" />
    <a class="a-link-gt" href="<%= hdnGioiThieu.Value %>"></a>
    <div class="wrapper-menu wrap-site">
        <div class="wrapper-main">
            <div id="site">
                <a href="~/" runat="server">Trang chủ </a>/ <span>
                    <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
    <div class="wrapper-main">
        <div class="wrapper-text about-us">
            <asp:ListView ID="lstAbout" runat="server" DataSourceID="odsAbout" EnableModelValidation="True">
                <ItemTemplate>
                    <h1 class="title">
                        <%# Eval("ArticleTitle") %></h1>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                </ItemTemplate>
                <LayoutTemplate>
                    <span runat="server" id="itemPlaceholder" />
                </LayoutTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="odsAbout" runat="server" 
                SelectMethod="ArticleSelectOne" TypeName="TLLib.Article">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ArticleID" QueryStringField="gt" 
                        Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
