<%@ Page Title="" Language="C#" MasterPageFile="~/site-sub.master" AutoEventWireup="true"
    CodeFile="lien-he.aspx.cs" Inherits="lien_he" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <title>Liên Hệ</title>
    <meta name="description" content="Liên Hệ" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper-menu wrap-site">
        <div class="wrapper-main">
            <div id="site">
                <a href="~/" runat="server">Trang chủ </a>/ <span>Liên hệ</span>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
    <div class="wrapper-main">
        <div class="contact-wrapper">
            <div class="contact-left">
                <div class="address-contact">
                    <h2>
                        Hoàn Mỹ</h2>
                    <div class="address-content">
                        <p>
                            <span class="icon-p">
                                <img src="assets/images/icon-c-1.png" alt="" /></span>Cơ sở kinh doanh Hòan Mỹ, 180/60 Phạm Phú Thứ, Phường 4, Quận 6, Tp.HCM</p>
                        <p>
                            <span class="icon-p">
                                <img src="assets/images/icon-c-2.png" alt="" /></span>Tel: 08 38543138 / 0822 126 345</p>
                        <p>
                            <span class="icon-p">
                                <img src="assets/images/icon-c-3.png" alt="" /></span>Email: <a href="mailTo:cohoanmy@gmail.com">
                                    cohoanmy@gmail.com</a></p>
                    </div>
                </div>
            </div>
            <div class="contact-right">
                <div class="mapw">
                    <div id="mapwrap">
                        <iframe id="iframe" src="map.aspx" frameborder="0" height="100%" width="100%"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
