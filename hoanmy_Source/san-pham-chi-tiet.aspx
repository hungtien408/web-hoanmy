<%@ Page Title="" Language="C#" MasterPageFile="~/site-product.master" AutoEventWireup="true"
    CodeFile="san-pham-chi-tiet.aspx.cs" Inherits="san_pham_chi_tiet" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <title>HOÀN MỸ</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hdnSanPhamDetails" runat="server" />
    <a class="a-link-spct" href="<%= hdnSanPhamDetails.Value %>"></a>
    <div class="wrapper-menu wrap-site">
        <div class="wrapper-main">
            <%--<div id="site">
                <a href="~/" runat="server">Trang chủ </a>/ <a href="#">Sản phẩm </a>/ <span>Cọ lăn sơn</span>
            </div>--%>
            <div id="site">
                <asp:ListView ID="lstBreadcrum" runat="server" DataSourceID="odsBreadcrum" EnableModelValidation="True">
                    <ItemTemplate>
                        <%# "<a href='" + progressTitle(Eval("ProductCategoryName")) + "-pci-" + Eval("ProductCategoryID") + ".aspx" + "'>" + Eval("ProductCategoryName") + "</a>/ "%>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <a href="~/" runat="server">Trang chủ</a>/ <span runat="server" id="itemPlaceholder" />
                    </LayoutTemplate>
                </asp:ListView>
                <asp:ObjectDataSource ID="odsBreadcrum" runat="server" SelectMethod="ProductCategoryHierarchyToTopSelectAll"
                    TypeName="TLLib.ProductCategory">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CurrentProductCategoryID" QueryStringField="pci"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <span>
                    <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
    <div id="colMain">
        <div class="head">
            <h2 class="title-head">
                <asp:Label ID="lblTitle1" runat="server"></asp:Label></h2>
        </div>
        <asp:ListView ID="lstProductDetails" runat="server" DataSourceID="odsProductDetails"
            EnableModelValidation="True">
            <ItemTemplate>
                <div class="product-details">
                    <div class="details-left">
                        <asp:HiddenField ID="hdnProductID" runat="server" Value='<%# Eval("ProductID") %>' />
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="odsProductImage">
                            <ItemTemplate>
                                <img id="zoom_03" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'
                                    data-zoom-image='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>' />
                                <div class="jcarousel-wrapper">
                                    <div class="jcarousel" data-jcarousel="true">
                                        <div id="gallery">
                                            <%--<asp:HiddenField ID="hdnProductID" runat="server" Value="8" />--%>
                                            <asp:ListView ID="ListView1" runat="server" DataSourceID="odsProductImage" EnableModelValidation="True">
                                                <ItemTemplate>
                                                    <a class="elevatezoom-gallery" href="#" data-image='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'
                                                        data-zoom-image='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>'>
                                                        <img id="img_01" src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "res/product/album/" + Eval("ImageName") : "assets/images/details-img-1.jpg" %>' />
                                                    </a>
                                                </ItemTemplate>
                                                <LayoutTemplate>
                                                    <span runat="server" id="itemPlaceholder" />
                                                </LayoutTemplate>
                                            </asp:ListView>
                                        </div>
                                    </div>
                                </div>
                                <a href="#" class="jcarousel-details-prev" data-jcarouselcontrol="true">‹</a> <a
                                    href="#" class="jcarousel-details-next" data-jcarouselcontrol="true">›</a>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="odsProductImage" runat="server" SelectMethod="ProductImageSelectAll"
                            TypeName="TLLib.ProductImage">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hdnProductID" Name="ProductID" PropertyName="Value"
                                    Type="String" />
                                <asp:Parameter DefaultValue="True" Name="IsAvailable" Type="String" />
                                <asp:Parameter Name="Priority" Type="String" />
                                <asp:Parameter DefaultValue="True" Name="SortByPriority" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                    <div class="details-right">
                        <h2 class="title-details">
                            <%# Eval("ProductName") %></h2>
                        <div class="content">
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Content") %>'></asp:Label>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <span runat="server" id="itemPlaceholder" />
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductDetails" runat="server" SelectMethod="ProductSelectOne"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <h2 class="title-same">
            Sản phẩm cùng loại</h2>
        <asp:ListView ID="lstProductSame" runat="server" DataSourceID="odsProductSame" EnableModelValidation="True">
            <ItemTemplate>
                <div class="box-product same-box">
                    <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'
                        class="product-img">
                        <img src='<%# !string.IsNullOrEmpty(Eval("ImageName").ToString()) ? "~/res/product/" + Eval("ImageName") : "~/assets/images/img-product-1.jpg" %>'
                            alt="" runat="server" /></a>
                    <h3 class="product-name">
                        <a href='<%# progressTitle(Eval("ProductName")) + "-pci-" + Eval("CategoryID") + "-pi-" + Eval("ProductID") + ".aspx" %>'>
                            <%# Eval("ProductName") %></a></h3>
                    <div class="description">
                        <%# Eval("Description") %>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div class="list-product product-same">
                    <span runat="server" id="itemPlaceholder" />
                </div>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="odsProductSame" runat="server" SelectMethod="ProductSameSelectAll"
            TypeName="TLLib.Product">
            <SelectParameters>
                <asp:Parameter DefaultValue="4" Name="RerultCount" Type="String" />
                <asp:QueryStringParameter Name="ProductID" QueryStringField="pi" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
